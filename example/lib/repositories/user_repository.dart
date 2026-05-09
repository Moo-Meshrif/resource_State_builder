import '../models/user.dart';

class UserRepository {
  Future<User> fetchProfile() async {
    await Future.delayed(const Duration(seconds: 1));
    // Simulate error occasionally if needed, but for now just success
    return User.mock;
  }
}
