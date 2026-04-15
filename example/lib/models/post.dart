import 'package:resource_state_builder/resource_state_builder.dart';

class Post {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  static List<Post> get mock => List.generate(
        10,
        (index) => Post(
          id: index,
          title: 'Loading title...',
          body: 'Loading body content...',
        ),
      );
}

class PostsResponse implements PaginatedData<Post> {
  final List<Post> posts;
  final int total, skip, limit;

  PostsResponse({
    required this.posts,
    this.total = 0,
    this.skip = 0,
    this.limit = 0,
  });

  @override
  List<Post> get items => posts;

  @override
  bool get hasMore => skip + limit < total;

  PostsResponse copyWith({
    List<Post>? posts,
    int? total,
    int? skip,
    int? limit,
  }) =>
      PostsResponse(
        posts: posts ?? this.posts,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory PostsResponse.fromJson(Map<String, dynamic> json) => PostsResponse(
        posts: List.from(json['posts'] ?? [])
            .map((json) => Post.fromJson(json))
            .toList(),
        total: json['total'] ?? 0,
        skip: json['skip'] ?? 0,
        limit: json['limit'] ?? 0,
      );

  factory PostsResponse.mock(List<Post> posts) => PostsResponse(
        posts: posts,
        total: 100,
        skip: 0,
        limit: 10,
      );
}
