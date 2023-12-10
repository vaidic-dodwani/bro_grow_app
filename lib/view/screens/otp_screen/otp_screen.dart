import 'package:bro_grow_app/data/remote/network/network_services.dart';
import 'package:bro_grow_app/utils/constants/app_assets.dart';
import 'package:bro_grow_app/utils/constants/app_colors.dart';
import 'package:bro_grow_app/utils/constants/app_typography.dart';
import 'package:bro_grow_app/utils/toast_functions.dart';
import 'package:bro_grow_app/view/shared/custom_button.dart';
import 'package:bro_grow_app/view_model/login_view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late TextEditingController pinController;

  @override
  void initState() {
    pinController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Consumer<LoginProvider>(
            builder: (context, loginProv, child) => Column(
              children: [
                const Text("BroGrow", style: AppTypography.f24w700),
                const SizedBox(height: 10),
                Image.asset(AppAssets.loginAsset,
                    width: MediaQuery.sizeOf(context).width),
                const SizedBox(height: 10),
                const Text("Enter Your OTP", style: AppTypography.f24w700),
                const SizedBox(height: 10),
                Pinput(
                  controller: pinController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  followingPinTheme: followingPinTheme,
                  length: 6,
                  onSubmitted: (String pin) {
                    loginProv.verifyOtp(context,
                        verificationId: widget.verificationId,
                        otp: pinController.text);
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                    isLoading: loginProv.otpVerifyApiResponse.status ==
                        ApiStatus.loading,
                    buttonText: "Verify",
                    function: () {
                      if (pinController.text.isEmpty) {
                        AppToasts.showErrorToast("Please enter OTP");
                        return;
                      }
                      loginProv.verifyOtp(context,
                          verificationId: widget.verificationId,
                          otp: pinController.text);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const defaultPinTheme = PinTheme(
  height: 56,
  width: 56,
  textStyle: AppTypography.f16w500,
  decoration: BoxDecoration(
    border: Border(bottom: BorderSide(width: 1.0, color: Colors.transparent)),
  ),
);

const focusedPinTheme = PinTheme(
  height: 56,
  width: 56,
  textStyle: AppTypography.f16w500,
  decoration: BoxDecoration(
    border:
        Border(bottom: BorderSide(width: 1.0, color: AppColors.primaryColor)),
  ),
);

const followingPinTheme = PinTheme(
  height: 56,
  width: 56,
  textStyle: AppTypography.f16w500,
  decoration: BoxDecoration(
    border:
        Border(bottom: BorderSide(width: 1.0, color: AppColors.primaryColor)),
  ),
);
