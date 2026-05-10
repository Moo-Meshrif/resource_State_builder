import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resource_state_builder/resource_state_builder.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../repositories/post_repository.dart';
import '../repositories/user_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _repository;
  final UserRepository _userRepository;
  int _skip = 0;
  final int _limit = 15;

  PostCubit(this._repository, this._userRepository) : super(PostState()) {
    fetchProfile();
    fetchPosts();
  }

  @override
  void emit(PostState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  Future<void> refreshAll([bool redirect = false]) async {
    await Future.wait([
      refreshPosts(redirect),
      refreshProfile(redirect),
    ]);
  }

  Future<void> refreshProfile([bool redirect = false]) => fetchProfile(
        refresh: true,
        redirect: redirect,
      );

  Future<void> fetchProfile({
    bool refresh = false,
    bool redirect = false,
  }) async {
    emit(state.copyWith(
      userResource: state.userResource.toLoading(
        refresh: refresh,
        redirect: redirect,
      ),
    ));
    try {
      final user = await _userRepository.fetchProfile();
      emit(state.copyWith(userResource: Resource.loaded(user)));
    } catch (e) {
      emit(state.copyWith(userResource: Resource.error(e.toString())));
    }
  }

  Future<void> refreshPosts([bool redirect = false]) => fetchPosts(
        refresh: !redirect,
        redirect: redirect,
      );

  Future<void> fetchPosts({
    bool refresh = false,
    bool redirect = false,
  }) async {
    emit(state.copyWith(
      postResource: state.postResource.toLoading(
        refresh: refresh,
        redirect: redirect,
      ),
    ));
    _skip = 0;
    try {
      final response = await _repository.fetchPosts(
        skip: _skip,
        limit: _limit,
      );
      emit(
        state.copyWith(
          postResource: Resource.loaded(response),
        ),
      );
    } catch (e) {
      emit(state.copyWith(postResource: Resource.error(e.toString())));
    }
  }

  Future<void> loadMore() async {
    final currentData = state.postResource.data;

    if (currentData == null ||
        !currentData.hasMore ||
        state.postResource.isGettingMore) {
      return;
    }

    emit(state.copyWith(
      postResource: state.postResource.toGettingMore(),
    ));

    _skip += _limit;
    try {
      final response = await _repository.fetchPosts(
        skip: _skip,
        limit: _limit,
      );
      emit(state.copyWith(
        postResource: state.postResource.appendItems(
          response,
          (merged, page) => page.copyWith(posts: merged),
          mapStatus: (d) => Resource.loaded(d),
        ),
      ));
    } catch (e) {
      emit(
        state.copyWith(
          postResource: Resource.loaded(
            currentData,
          ),
        ),
      );
    }
  }

  void deletePost(int id) => emit(state.copyWith(
        postResource: state.postResource.removeWhere(
          (post) => post.id == id,
          (items, current) => current.copyWith(posts: items),
        ),
      ));

  void markPostRead(int id) => emit(state.copyWith(
        postResource: state.postResource.updateWhere(
          (post) => post.id == id,
          (post) => post.copyWith(isRead: true),
          (items, current) => current.copyWith(posts: items),
        ),
      ));
}
