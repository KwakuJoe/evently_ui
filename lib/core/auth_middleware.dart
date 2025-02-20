import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthService _authService = AuthService();

  @override
  RouteSettings? redirect(String? route) {
    // Redirect to login if not authenticated
    if (!_authService.isAuthenticated()) {
      return const RouteSettings(name: '/login');
    }
    return null; // Allow access to the route
  }
}