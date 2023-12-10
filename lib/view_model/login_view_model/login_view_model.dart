import 'dart:developer';

import 'package:bro_grow_app/data/local/local_storage.dart';
import 'package:bro_grow_app/data/remote/network/network_services.dart';
import 'package:bro_grow_app/utils/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginProvider extends ChangeNotifier {
//
  ApiResponse _loginApiResponse = ApiResponse.initial();
  ApiResponse get loginApiResponse => _loginApiResponse;
  set loginApiResponse(ApiResponse _) {
    _loginApiResponse = _;
    notifyListeners();
  }

//

//
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;

//

  Future<void> saveUserState(bool loggedIn) async {
    await LocalStorageService.setBool(LocalStorageKeys.isLoggedIn, loggedIn);
  }

  Future<bool> getUserState() async {
    return await LocalStorageService.getBool(LocalStorageKeys.isLoggedIn) ??
        false;
  }

//

  Future<void> sendOtp(BuildContext context,
      {required String phoneNumner}) async {
    loginApiResponse = ApiResponse.loading();
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumner,
        timeout: const Duration(seconds: 120),
        verificationCompleted: (phoneAuthCredential) {
          log("verificationCompleted $phoneAuthCredential");
        },
        verificationFailed: (error) {
          log("verificationFailed $error");
          loginApiResponse = ApiResponse.error(error.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          log("codeSent $verificationId $forceResendingToken");
          loginApiResponse = ApiResponse.completed(verificationId);
          context.goNamed(AppRouteNames.otpScreenRoute,
              extra: {"verificationId": verificationId});
        },
        codeAutoRetrievalTimeout: (verificationId) {
          log("codeAutoRetrievalTimeout $verificationId");
          loginApiResponse = ApiResponse.error("Timeout");
        });
  }

//
  ApiResponse _otpVerifyApiResponse = ApiResponse.initial();
  ApiResponse get otpVerifyApiResponse => _otpVerifyApiResponse;
  set otpVerifyApiResponse(ApiResponse _) {
    _otpVerifyApiResponse = _;
    notifyListeners();
  }
//

  Future<void> verifyOtp(BuildContext context,
      {required String verificationId, required String otp}) async {
    otpVerifyApiResponse = ApiResponse.loading();
    final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await _auth.signInWithCredential(phoneAuthCredential).then((value) {
      log("signInWithCredential $value");
      saveUserState(true);
      otpVerifyApiResponse = ApiResponse.completed(value);
      context.goNamed(AppRouteNames.pincodeRoute);
    }).catchError((error) {
      saveUserState(false);
      log("signInWithCredential $error");
      otpVerifyApiResponse = ApiResponse.error(error.toString());
    });
  }
}
