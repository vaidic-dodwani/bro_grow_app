import 'package:bro_grow_app/data/remote/network/response/api_responses.dart';
import 'package:flutter/material.dart';

class SplashScreenNotifier extends ChangeNotifier {
//
  ApiResponse _apiResponse = ApiResponse.initial();
  ApiResponse get apiResponse => _apiResponse;
  set apiResponse(ApiResponse _) {
    _apiResponse = _;
    notifyListeners();
  }
//
}
