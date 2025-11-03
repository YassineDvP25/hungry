import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => 'ApiException ($statusCode): $message';

  /// Factory method to handle Dio errors gracefully
  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException("Connection timeout. Please try again later.");
      case DioExceptionType.sendTimeout:
        return ApiException("Send timeout. Please try again later.");
      case DioExceptionType.receiveTimeout:
        return ApiException("Receive timeout. Please try again later.");
      case DioExceptionType.badCertificate:
        return ApiException("Invalid SSL certificate from the server.");
      case DioExceptionType.badResponse:
        return ApiException._handleBadResponse(error.response);
      case DioExceptionType.cancel:
        return ApiException("Request was cancelled by the user.");
      case DioExceptionType.connectionError:
        return ApiException("Failed to connect to the server. Check your internet connection.");
      case DioExceptionType.unknown:
        return ApiException("An unexpected error occurred. Please try again.");
      
    }
  }

  /// Handle different HTTP response codes
  static ApiException _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode;
    final message = response?.data is Map && response?.data['message'] != null
        ? response?.data['message'].toString()
        : "Something went wrong while processing your request.";

    switch (statusCode) {
      case 400:
        return ApiException("Bad Request: $message", statusCode);
      case 401:
        return ApiException("Unauthorized: Please log in again.", statusCode);
      case 403:
        return ApiException("Forbidden: You don’t have permission to access this resource.", statusCode);
      case 404:
        return ApiException("Not Found: The requested resource could not be found.", statusCode);
      case 500:
        return ApiException("Internal Server Error. Please try again later.", statusCode);
      default:
        return ApiException(message!, statusCode);
    }
  }
}
