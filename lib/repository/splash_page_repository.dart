import '../data/remote/network/api_end_points.dart';
import '../data/remote/network/network_api_service.dart';

abstract class _SplashPageAbstract {
  Future<dynamic> tempApi(Map<String, dynamic> body);
}

class SplashPagesRepository extends _SplashPageAbstract {
  final _apiService = NetworkApiService();

  @override
  Future<dynamic> tempApi(dynamic body) async {
    try {
      final resp =
          await _apiService.postResponse(ApiLinks.tempUrl, body);
      return resp;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
