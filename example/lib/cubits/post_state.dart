part of 'post_cubit.dart';

class PostState {
  final Resource<PostsResponse, String> postResource;

  PostState({this.postResource = const Resource.initial()});

  PostState copyWith({Resource<PostsResponse, String>? postResource}) =>
      PostState(
        postResource: postResource ?? this.postResource,
      );
}
