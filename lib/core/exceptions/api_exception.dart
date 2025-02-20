// import 'package:dio/dio.dart';

// class ApiException implements Exception {
//   final String message;
//   final int? statusCode;
//   final Map<String, dynamic>? errors;

//   ApiException(this.message, {this.statusCode, this.errors});

//   factory ApiException.fromDioError(DioException dioError) {
//     String errorMessage = 'Something went wrong. Please try again.';
//     Map<String, dynamic>? errors;

//     // Handle validation errors
//     if (dioError.response?.data != null && dioError.response?.data is Map) {
//       print('there is validation errrors');
//       final responseData = dioError.response!.data as Map<String, dynamic>;
//       if (responseData.containsKey('errors')) {
//         errorMessage = responseData['message'] ?? errorMessage;
//         errors = responseData['errors'] as Map<String, dynamic>;
//       }
//     }
//     // Handle network errors
//     else if (dioError.type == DioExceptionType.connectionTimeout ||
//         dioError.type == DioExceptionType.receiveTimeout ||
//         dioError.type == DioExceptionType.sendTimeout) {
//       errorMessage = 'Connection timeout. Please check your internet connection.';
//     }
//     // Handle server errors
//     else if (dioError.response?.statusCode != null &&
//         dioError.response!.statusCode! >= 500) {
//       errorMessage = 'Server error. Please try again later.';
//     }

//     return ApiException(
//       errorMessage,
//       statusCode: dioError.response?.statusCode,
//       errors: errors,
//     );
//   }

//   @override
//   String toString() {
//     if (errors != null) {
//       return message;
//     }
//     return message;
//   }
// }

  // Handle different types of errors
