import 'package:bro_grow_app/data/remote/network/api_end_points.dart';
import 'package:bro_grow_app/data/remote/network/network_api_service.dart';

abstract class _HomePageAbstract {
  Future<dynamic> getData(dynamic jsonBody);
}

class HomePageRepository extends _HomePageAbstract {
  final _apiService = NetworkApiService();
  @override
  Future<dynamic> getData(dynamic jsonBody) async {
    try {
      final resp = await _apiService.postResponse(
        ApiLinks.getBusinessData,
        jsonBody,
      );
      return resp;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
