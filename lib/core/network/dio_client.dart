// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:ticket_app_ui/core/exceptions/api_exception.dart';

class DioClient {
  final Dio _dio;
  final GetStorage _storage;

  DioClient({required String baseUrl})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        ),
        _storage = GetStorage() {
    _addInterceptors();
  }

  // Add interceptors for logging, error handling, etc.
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = _storage.read('token');

          // Ensure every request accepts JSON
          options.headers['Accept'] = 'application/json';
          
          // token
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Log responses
          print('Response: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          // Log the error details
          // print('DioError: ${error.message}');
          // print('DioError Type: ${error.type}');
          // print('DioError Response: ${error.response?.data}');
          // print('DioError Status Code: ${error.response?.statusCode}');
          // Handle errors globally
  
          // throw ApiException.fromDioError(error);
          // handleDioError(error);
          throw error;
        },
      ),
    );
  }

  // GET request
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(endpoint, queryParameters: queryParameters);
  }

  // POST request
  Future<Response> post(String endpoint, {dynamic data}) async {
    return await _dio.post(endpoint, data: data);
  }

  // PUT request
  Future<Response> put(String endpoint, {dynamic data}) async {
    return await _dio.put(endpoint, data: data);
  }

  // DELETE request
  Future<Response> delete(String endpoint) async {
    return await _dio.delete(endpoint);
  }


  // handle dio eerros
  Map<String, dynamic> handleDioError(DioException e) {
    String message = "Something went wrong. Please try again.";
    Map<String, dynamic>? validationErrors;

    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final responseData = e.response!.data;

      // Handle Laravel validation errors (422)
      if (statusCode == 422 && responseData is Map<String, dynamic>) {
        message = responseData['message'] ?? 'Validation failed';
        validationErrors = responseData['errors'] as Map<String, dynamic>?; 
      } 
      // Handle Unauthorized (401) & Forbidden (403)
      else if (statusCode == 401) {
        message = "Unauthorized. Please log in again.";
      } else if (statusCode == 403) {
        message = "Forbidden. You don't have permission to perform this action.";
      } 
      // Handle Not Found (404)
      else if (statusCode == 404) {
        message = "Resource not found.";
      } 
      // Handle Redirection (3xx)
      else if (statusCode! >= 300 && statusCode < 400) {
        message = "Unexpected redirect. Please check your request URL.";
      } 
      // Handle Server errors (500+)
      else if (statusCode >= 500) {
        message = "Server error. Please try again later.";
      } else {
        message = responseData.toString();
      }
    } 
    // Handle Network errors
    else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      message = "Connection timeout. Please check your internet connection.";
    } else if (e.type == DioExceptionType.unknown) {
      message = "Network error. Please check your connection.";
    }

    return {
      'success': false,
      'message': message,
      'errors': validationErrors, // Can be null if not a validation error
    };
  }
}
