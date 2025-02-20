import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticket_app_ui/core/auth_service.dart';
// import 'package:ticket_app_ui/core/exceptions/api_exception.dart';
import 'package:ticket_app_ui/data/datasources/remote/auth_remote_data_source.dart';
import 'package:ticket_app_ui/data/models/user_model.dart';
import 'package:ticket_app_ui/presentation/utils/utils.dart';

class AuthController extends GetxController {
  final AuthRemoteDataSource authRemoteDataSource;
  final GetStorage storage;
  AuthController({required this.authRemoteDataSource, required this.storage});

  // Reactive state for loading
  final RxBool isLoginLoading = false.obs;
  final RxBool isRegisterLoading = false.obs;
  final RxBool isLogoutLoading = false.obs;
  final RxBool isPasswordForgetLoading = false.obs;
  final RxBool isPasswordResetLoading = false.obs;

  // Reactive state for storing the logged-in user
  final Rx<User?> user = Rx<User?>(null);

  // Reactive state for validation errors
  final RxMap<String, dynamic> loginValidationErrors = RxMap<String, dynamic>();
  final RxMap<String, dynamic> signupValidationErrors = RxMap<String, dynamic>();
  final RxMap<String, dynamic> forgetPasswordValidationErrors = RxMap<String, dynamic>();
  final RxMap<String, dynamic> resetPasswordValidationErrors = RxMap<String, dynamic>();

  // Reactive state for error messages
  final RxString errorMessage = ''.obs;

  // auth service controller
  final AuthService _authService = AuthService();

  // Method to handle login
  Future<void> login(String email, String password) async {
    try {
      isLoginLoading.value = true; // Show loading indicator
      errorMessage.value = ''; // Clear any previous errors

      // Call the repository to perform login
      final res = await authRemoteDataSource.login(email, password);

      if (res.status == 200) {
        print(res);
        // Update the user state
        user.value = res.data?.user;

        // store token in secure storage
        await storage.write('token', res.data?.token);

        // store user info
        await storage.write('user', res.data?.user);

        // Navigate to the home screen or perform other actions
        Get.offAllNamed('/home-view'); // Example: Navigate to home screen

        isLoginLoading.value = false; // Hide loading indicator
      }
    } on DioException catch (e) {
      // Hide loading indicator
      isLoginLoading.value = false;
      // assign error messages
      errorMessage.value = e.response?.data['message'] ??
          e.response?.data['message'] ??
          e.message;
      // handles validation errors
      if (e.response?.statusCode == 422) {
        loginValidationErrors.value = Utils.handleValidationErrors(e);
      }
      // display error message
      Utils.showSnackbar(errorMessage.value,
          'Failed to login into your account into your account', true);
    }
  }

  // Method to handle logout
  Future<void> logout() async {
    _authService.logout();
    Get.snackbar('Logout successfully',
        'You successfully logout if your account, see you again soon',
        duration: const Duration(seconds: 20),
        icon: const Icon(Icons.error_outline),
        backgroundColor: Colors.green,
        colorText: Colors.white);
  }

  // handle sign  up
  Future<void> register(
      String name, String email, String password, String phone) async {
    try {
      isRegisterLoading.value = true;
      signupValidationErrors.clear();

      final res =
          await authRemoteDataSource.register(name, email, password, phone);

      if (res.status == 200) {
        debugPrint(res.toString());
        // Update the user state
        user.value = res.data?.user;

        // store token in secure storage
        await storage.write('token', res.data?.token);

        // store user info
        await storage.write('user', res.data?.user);

        // Navigate to the home screen or perform other actions
        Get.offAllNamed(
            '/personalize'); // Example: Navigate to personalized screen

        isLoginLoading.value = false; // Hide loading indicator
      }
    } on DioException catch (e) {
      isRegisterLoading.value = false;
      // assign error messages
      errorMessage.value = e.response?.data['message'] ??
          e.response?.data['message'] ??
          e.message;
      // handles validation errors
      if (e.response?.statusCode == 422) {
        signupValidationErrors.value = Utils.handleValidationErrors(e);
      }
      // display error message
      Utils.showSnackbar(
        errorMessage.value,
        'Failed to create an account into your account',
        true,
      );
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      isPasswordForgetLoading.value = true;

      final res = await authRemoteDataSource.forgetPassword(email);

      if (res.status == 200) {
        Get.toNamed('/reset-password', arguments: {
          'email':email
        });
        Utils.showSnackbar(
          res.message,
          'OTP has been sent to your email',
          false,
        );
      }

      isPasswordForgetLoading.value = false;
    } on DioException catch (e) {
      isPasswordForgetLoading.value = false;

            // assign error messages
      errorMessage.value = e.response?.data['message'] ??
          e.response?.data['message'] ??
          e.message;
      // handles validation errors
      if (e.response?.statusCode == 422) {
        forgetPasswordValidationErrors.value = Utils.handleValidationErrors(e);
      }
      // display error message
      Utils.showSnackbar(
        errorMessage.value,
        'Something went wrong, please try again',
        true,
      );
    }
  }

    Future<void> resetPassword(String email, String otp, String password, String password_confirmation) async {
    try {
      isPasswordResetLoading.value = true;

      final res = await authRemoteDataSource.resetPassword(
       email,
       otp,
       password,
       password_confirmation
      );

      if (res.status == 200) {
        Get.toNamed('/login');
        Utils.showSnackbar(
          res.message,
          'Your password is updated successfully, login in with new credentials',
          false,
        );
      }

      isPasswordResetLoading.value = false;
    } on DioException catch (e) {
      isPasswordResetLoading.value = false;

            // assign error messages
      errorMessage.value = e.response?.data['message'] ??
          e.response?.data['message'] ??
          e.message;
      // handles validation errors
      if (e.response?.statusCode == 422) {
        resetPasswordValidationErrors.value = Utils.handleValidationErrors(e);
        debugPrint(resetPasswordValidationErrors.values.toString());
      }
      // display error message
      Utils.showSnackbar(
        errorMessage.value,
        'Something went wrong, please try again',
        true,
      );
    }
  }
  
}
