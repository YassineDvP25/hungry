import 'package:hungry/core/network/api_exceptions.dart';
import 'package:hungry/core/network/api_serves.dart';
import 'package:hungry/features/home/data/home_model.dart';

class HomeRepository {
  final ApiService _api = ApiService();

  Future<HomeResponse> getHomeProducts() async {
    try {
      return await _api.getRequest<HomeResponse>(
        '/products',
        fromJson: (json) => HomeResponse.fromJson(json),
      );
    } on ApiException catch (e) {
      throw ApiException(e.message, e.statusCode);
    }
  }
}
