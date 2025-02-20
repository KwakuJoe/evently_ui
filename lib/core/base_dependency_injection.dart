
import 'package:get/get.dart';
import '../core/network/dio_client.dart';
import '../core/dependency_injections/auth_dependency_injection.dart' as auth;
import '../core/network/api_endpoints.dart'; // Add this import

class BaseDependencyInjection {
  static void init() {
    // Initialize DioClient
     final dioClient = DioClient(baseUrl: ApiEndpoints.baseUrl);
     
     // use get x to inject DioClient
     Get.put(dioClient);


    // Initialize dependencies for auth
    auth.AuthDependencyInjection.init();

    // Initialize dependencies for other features
  }
}