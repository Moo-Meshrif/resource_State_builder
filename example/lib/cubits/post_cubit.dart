import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resource_state_builder/resource_state_builder.dart';
import '../models/post.dart';
import '../repositories/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _repository;
  int _skip = 0;
  final int _limit = 15;

  PostCubit(this._repository) : super(PostState());

  @override
  void emit(PostState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  Future<void> refreshPosts([bool redirect = false]) => fetchPosts(
        refresh: true,
        redirect: redirect,
      );

  Future<void> fetchPosts({
    bool refresh = false,
    bool redirect = false,
  }) async {
    emit(
      state.copyWith(
        postResource: state.postResource.toLoading(
          refresh: refresh,
          redirect: redirect,
        ),
      ),
    );
    _skip = 0;
    try {
      final response = await _repository.fetchPosts(
        skip: _skip,
        limit: _limit,
      );
      emit(state.copyWith(postResource: Resource.loaded(response)));
    } catch (e) {
      emit(state.copyWith(postResource: Resource.error(e.toString())));
    }
  }

  Future<void> loadMore() async {
    try {
      final currentData = state.postResource.data;
      if (currentData == null ||
          !currentData.hasMore ||
          state.postResource.isGettingMore) {
        return;
      }

      emit(state.copyWith(
        postResource: Resource.gettingMore(currentData),
      ));

      _skip += _limit;
      final response = await _repository.fetchPosts(
        skip: _skip,
        limit: _limit,
      );

      final updatedItems = [...currentData.items, ...response.items];
      emit(
        state.copyWith(
          postResource: Resource.loaded(
            response.copyWith(posts: updatedItems),
          ),
        ),
      );
    } catch (e) {
      final currentData = state.postResource.data;
      if (currentData == null) {
        emit(state.copyWith(postResource: Resource.error(e.toString())));
        return;
      }
      emit(
        state.copyWith(
          postResource: Resource.loaded(
            currentData,
          ),
        ),
      );
    }
  }
}
