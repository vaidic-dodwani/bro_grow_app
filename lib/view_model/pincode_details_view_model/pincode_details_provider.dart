import 'dart:developer';

import 'package:bro_grow_app/data/local/local_storage_paths.dart';
import 'package:bro_grow_app/data/local/local_storage_service.dart';
import 'package:bro_grow_app/repository/third_party_repository.dart';
import 'package:bro_grow_app/utils/routes/routes.dart';
import 'package:bro_grow_app/utils/toast_functions.dart';
import 'package:bro_grow_app/view/shared/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PincodeProvider extends ChangeNotifier {
//
  String _state = "";
  String get state => _state;
  set state(String _) {
    _state = _;
    notifyListeners();
  }

//
  String _city = "";
  String get city => _city;
  set city(String _) {
    _city = _;
    notifyListeners();
  }

  String _category = "";
  String get category => _category;
  set category(String _) {
    _category = _;
    notifyListeners();
  }
//

//
  String _pincode = '';
  String get pincode => _pincode;
  set pincode(String _) {
    _pincode = _;
    notifyListeners();
  }
//

  Future<void> autoFillCityState(BuildContext context, String pincode) async {
    try {
      showLoadingDialog(context);

      final res =
          await ThirdPartyApiRepository().getCityStateFromPincode(pincode);
      final data = res[0];
      if (data['Status'] == "Success") {
        city = data['PostOffice'][0]['District'];
        state = data['PostOffice'][0]['State'];
      }
    } catch (e) {
      log(e.toString());
    } finally {
      context.pop();
      notifyListeners();
    }
  }

  Future<void> saveDetails(
    BuildContext context,
  ) async {
    if (city.isEmpty || state.isEmpty || pincode.isEmpty || category.isEmpty) {
      AppToasts.showErrorToast("Fill All Fields");
    } else {
      await LocalStorageService.setString(LocalStorageKeys.city, city);
      await LocalStorageService.setString(LocalStorageKeys.state, state);
      await LocalStorageService.setString(LocalStorageKeys.pincode, pincode);
      await LocalStorageService.setString(LocalStorageKeys.category, category);
      context.goNamed(AppRouteNames.homeScreenRoute);
    }
  }

  Future<void> getDetails() async {
    _city = await LocalStorageService.getString(LocalStorageKeys.city) ?? '';
    _state = await LocalStorageService.getString(LocalStorageKeys.state) ?? '';
    _pincode =
        await LocalStorageService.getString(LocalStorageKeys.pincode) ?? '';
    _category =
        await LocalStorageService.getString(LocalStorageKeys.category) ?? '';
  }
}
