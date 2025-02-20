import 'package:ticket_app_ui/core/network/api_endpoints.dart';
import 'package:ticket_app_ui/core/network/dio_client.dart';
import 'package:ticket_app_ui/data/models/base_models/resource_fetch_response_model.dart';
import 'package:ticket_app_ui/data/models/user_model.dart';

class AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSource({required this.dioClient});

  // login
  Future<ResourceFetchResponseModel<UserModel>> login(
      String email, String password) async {
    final response = await dioClient.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );
    return ResourceFetchResponseModel<UserModel>.fromJson(
      response.data,
      UserModel.fromJson,
    );
  }

// register
  Future<ResourceFetchResponseModel<UserModel>> register(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    final response = await dioClient.post(
      ApiEndpoints.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'role': 'attendee',
        'is_active': 1
      },
    );

    return ResourceFetchResponseModel<UserModel>.fromJson(
      response.data,
      UserModel.fromJson,
    );
  }

  // forgot password
  Future<ResourceFetchResponseModel<void>> forgetPassword(String email) async {
    final response = await dioClient.post(
      ApiEndpoints.forgotPassword,
      data: {'email': email},
    );

    return ResourceFetchResponseModel<void>.fromJson(
      response.data,
      null, // No need to parse anything from `data`
    );
  }

    Future<ResourceFetchResponseModel<void>> resetPassword(String email, String otp, String password, String password_confirmation) async {
    final response = await dioClient.post(
      ApiEndpoints.resetPassword,
      data: {
        'email': email,
        'otp' :otp,
        'password' : password,
        'password_confirmation' : password_confirmation
        },
    );

    return ResourceFetchResponseModel<void>.fromJson(
      response.data,
      null, // No need to parse anything from `data`
    );
  }
  
}
