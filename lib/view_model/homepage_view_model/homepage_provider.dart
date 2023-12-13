import 'dart:convert';

import 'package:bro_grow_app/data/remote/network/network_services.dart';
import 'package:bro_grow_app/model/business_data_model.dart';
import 'package:bro_grow_app/repository/home_page_repository.dart';
import 'package:bro_grow_app/view/screens/homescreen/widgets/competitor_card.dart';
import 'package:bro_grow_app/view_model/pincode_details_view_model/pincode_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageProvider extends ChangeNotifier {
//
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int _) {
    _pageIndex = _;
    notifyListeners();
  }
//

//
  ApiResponse _apiResponse = ApiResponse.initial();
  ApiResponse get apiResponse => _apiResponse;
  set apiResponse(ApiResponse _) {
    _apiResponse = _;
    notifyListeners();
  }

  void setChartData() {
    for (int i = 0;
        i < businessData!.competitorAnalysis!.competitors!.length;
        ++i) {
      _barChartData.add(
        BarChartData(
          businessData!.competitorAnalysis!.competitors![i].competitorName!,
          businessData!.competitorAnalysis!.competitors![i].competitorRating!,
          pallete[i],
        ),
      );
    }
  }

//
  BusinessData? _businessData;
  BusinessData? get businessData => _businessData;
  set businessData(BusinessData? _) {
    _businessData = _;
    setChartData();
    notifyListeners();
  }
//

//
  List<BarChartData> _barChartData = [];
  List<BarChartData> get barChartData => _barChartData;
  set barChartData(List<BarChartData> _) {
    _barChartData = _;
    notifyListeners();
  }
//

  Future<void> getBuissnessData(BuildContext context) async {
    final pinProv = Provider.of<PincodeProvider>(context, listen: false);
    try {
      apiResponse = ApiResponse.loading();
      final body = jsonEncode({
        "pincode": pinProv.pincode,
        "district": pinProv.city,
        "state": pinProv.state.replaceAll(" ", "-"),
        "typeofbusiness": pinProv.category
      });
      final res = await HomePageRepository().getData(body);
      _businessData = BusinessData.fromJson(res);
      setChartData();
      apiResponse = ApiResponse.completed(res);
    } catch (e) {
      apiResponse = ApiResponse.error(e.toString());
    }
  }
}

const List<Color> pallete = [
  Color(0xFF1f77b4),
  Color(0xFFff7f0e),
  Color(0xFF2ca02c),
  Color(0xFFd62728),
  Color(0xFF9467bd),
  Color(0xFF8c564b),
  Color(0xFFe377c2),
  Color(0xFF7f7f7f),
  Color(0xFFbcbd22),
  Color(0xFF17becf),
  Color(0xFFaec7e8),
  Color(0xFFffbb78),
  Color(0xFF98df8a),
  Color(0xFFff9896),
  Color(0xFFc5b0d5),
  Color(0xFFc49c94),
  Color(0xFFf7b6d2),
  Color(0xFFc7c7c7),
  Color(0xFFdbdb8d),
  Color(0xFF9edae5),
  Color(0xFF393b79),
  Color(0xFF637939),
  Color(0xFF8c6d31),
  Color(0xFF843c39),
  Color(0xFF7b4173),
  Color(0xFF5254a3),
  Color(0xFFbd9e39),
  Color(0xFF4a5584),
  Color(0xFF8ca252),
  Color(0xFF8c6d31),
  Color(0xFFe7cb94),
  Color(0xFF843c39),
  Color(0xFF7b4173),
  Color(0xFF5254a3),
  Color(0xFFbd9e39),
  Color(0xFF4a5584),
  Color(0xFF8ca252),
  Color(0xFFe7cb94),
  Color(0xFFe7969c),
  Color(0xFF637939),
  Color(0xFF8c6d31),
  Color(0xFFe7cb94),
  Color(0xFF843c39),
  Color(0xFF7b4173),
  Color(0xFF5254a3),
  Color(0xFFbd9e39),
  Color(0xFF4a5584),
  Color(0xFF8ca252),
  Color(0xFFe7cb94),
  Color(0xFFe7969c),
];
