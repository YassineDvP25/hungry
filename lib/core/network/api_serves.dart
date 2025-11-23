import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_exceptions.dart';
import 'package:hungry/core/network/dio_client.dart';

class ApiService {
  final DioClient _dioClient = DioClient();

  /// GET request
 Future<T> getRequest<T>(
    String endpoint, {
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dioClient.dio.get(
        endpoint,
        queryParameters: queryParams,
      );
      return fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  /// POST request
  Future<dynamic> postRequest(
    String endpoint, 
    Map<String, dynamic> data,
     
  ) async {
    try {
      final response = await _dioClient.dio.post(
        endpoint,
        data: data,
         
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  /// PUT request
  Future<dynamic> putRequest(
    String endpoint, 
    Map<String, dynamic> data,
     
  ) async {
    try {
      final response = await _dioClient.dio.put(
        endpoint,
        data: data,
         
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  /// DELETE request
  Future<dynamic> deleteRequest(
    String endpoint, 
      Map<String, dynamic> data,
     
  ) async {
    try {
      final response = await _dioClient.dio.delete(
        endpoint,
        data: data,
         
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
