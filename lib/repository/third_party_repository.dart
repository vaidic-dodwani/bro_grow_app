import 'package:bro_grow_app/data/remote/network/api_end_points.dart';
import 'package:bro_grow_app/data/remote/network/network_api_service.dart';

abstract class _ThirdPartyApiAbstract {
  Future<dynamic> getCityStateFromPincode(String pincode);
}

class ThirdPartyApiRepository extends _ThirdPartyApiAbstract {
  final _apiService = NetworkApiService();

  @override
  Future<dynamic> getCityStateFromPincode(String pincode) async {
    try {
      final resp = await _apiService.getResponse(
        ApiLinks.getCityStateUrl + pincode,
      );
      return resp;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
