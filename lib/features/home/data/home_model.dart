// lib/features/home/models/home_response.dart

import 'package:hungry/features/home/data/product_model.dart';

class HomeResponse {
  final int code;
  final String message;
  final List<ProductModel> products;

  HomeResponse({
    required this.code,
    required this.message,
    required this.products,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      products: (json['data'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList(),
    );
  }
}
