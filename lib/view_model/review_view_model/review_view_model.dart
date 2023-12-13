import 'dart:convert';

import 'package:bro_grow_app/data/remote/network/network_services.dart';
import 'package:bro_grow_app/model/reivew_model.dart';
import 'package:bro_grow_app/repository/home_page_repository.dart';
import 'package:bro_grow_app/view_model/pincode_details_view_model/pincode_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewProvider extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial();
  ApiResponse get apiResponse => _apiResponse;
  set apiResponse(ApiResponse _) {
    _apiResponse = _;
    notifyListeners();
  }

//
  ReviewModel? _reviewModel;
  ReviewModel? get reviewModel => _reviewModel;
  set reviewModel(ReviewModel? _) {
    _reviewModel = _;
    notifyListeners();
  }
//

  Future<void> getReview(BuildContext context) async {
    final pinProv = Provider.of<PincodeProvider>(context, listen: false);

    try {
      apiResponse = ApiResponse.loading();
      final body = jsonEncode(
        {
          "pincode": pinProv.pincode,
          "district": pinProv.city,
          "state": pinProv.state.replaceAll(" ", "-"),
          "typeofbusiness": pinProv.category
        },
      );
      final res = await HomePageRepository().getReview(body);
      _reviewModel = ReviewModel.fromJson(res);
      apiResponse = ApiResponse.completed(res);
    } on Exception catch (e) {
      apiResponse = ApiResponse.error(e.toString());
    }
  }
}
