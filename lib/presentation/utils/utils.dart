import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class Utils {
  /// ✅ Show a Snackbar message

  static void showSnackbar(String title, String message, bool isError) {
    Get.snackbar(title, message,
        duration: const Duration(seconds: 20),
        icon: isError
            ? const Icon(HugeIcons.strokeRoundedSettingsError02)
            : const Icon(HugeIcons.strokeRoundedCheckmarkCircle03),
        backgroundColor: isError ? Colors.red : Colors.green,
        colorText: Colors.white);
  }

  static dynamic handleValidationErrors(DioException dioError) {
    if (dioError.response?.statusCode == 422) {
      Map<String, dynamic> errors =
          dioError.response?.data['errors'] as Map<String, dynamic>;

      // Transform the data
      final Map<String, String> mappedErrors = errors.map((key, value) {
        // Join the list of error messages into a single string
        final errorMessage = value.join(', ');
        return MapEntry(key, errorMessage);
      });

        return mappedErrors;
    }
  }
}
