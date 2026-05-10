import 'package:dio/dio.dart';
import '../models/user.dart';

class UserRepository {
  final Dio _dio;

  UserRepository(this._dio);

  Future<User> fetchProfile() async {
    try {
      final response = await _dio.get('https://dummyjson.com/users/1');
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw Exception('Failed to load profile');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
