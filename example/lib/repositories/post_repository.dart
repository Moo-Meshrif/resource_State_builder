import 'package:dio/dio.dart';
import '../models/post.dart';

class PostRepository {
  final Dio _dio;

  PostRepository(this._dio);

  Future<PostsResponse> fetchPosts({int skip = 0, int limit = 15}) async {
    try {
      final response = await _dio.get(
        'https://dummyjson.com/posts?skip=$skip&limit=$limit',
      );

      if (response.statusCode == 200) {
        return PostsResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load posts');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
