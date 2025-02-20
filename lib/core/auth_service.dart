import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final GetStorage _storage = GetStorage();

  // Check if the user is authenticated
  bool isAuthenticated() {
    final token = _storage.read('token');
    return token != null;
  }

  // Get the token
  String? getToken() {
    return _storage.read('token');
  }

  // Clear the token (logout)
  void logout() {
    _storage.remove('token');
    _storage.remove('user');
    Get.offAllNamed('/login'); // Redirect to login screen
  }
}
