part of 'post_cubit.dart';

class PostState {
  final Resource<PostsResponse, String> postResource;
  final Resource<User, String> userResource;

  PostState({
    this.postResource = const Resource.initial(),
    this.userResource = const Resource.initial(),
  });

  PostState copyWith({
    Resource<PostsResponse, String>? postResource,
    Resource<User, String>? userResource,
  }) =>
      PostState(
        postResource: postResource ?? this.postResource,
        userResource: userResource ?? this.userResource,
      );
}
