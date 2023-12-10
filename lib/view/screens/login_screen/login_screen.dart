import 'package:bro_grow_app/data/remote/network/network_services.dart';
import 'package:bro_grow_app/utils/toast_functions.dart';
import 'package:bro_grow_app/view/shared/custom_button.dart';
import 'package:bro_grow_app/view_model/login_view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/app_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;
  late Country country;
  @override
  void initState() {
    phoneController = TextEditingController();
    country = countries.firstWhere((element) => element.name == "India");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.defaultWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("BroGrow", style: AppTypography.f24w700),
                const SizedBox(height: 10),
                Image.asset(AppAssets.loginAsset,
                    width: MediaQuery.sizeOf(context).width),
                const SizedBox(height: 10),
                const Text("Enter Your Mobile Number",
                    style: AppTypography.f20w500),
                const SizedBox(height: 10),
                IntlPhoneField(
                  controller: phoneController,
                  initialCountryCode: 'IN',
                  style: AppTypography.f16w400,
                  dropdownIconPosition: IconPosition.trailing,
                  flagsButtonPadding: const EdgeInsets.only(left: 15),
                  keyboardType: TextInputType.phone,
                  textAlignVertical: TextAlignVertical.center,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onCountryChanged: (value) {
                    country = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    border: InputBorder.none,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 10),
                Consumer<LoginProvider>(
                  builder: (context, loginProv, child) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomButton(
                        buttonText: "Login",
                        isLoading: loginProv.loginApiResponse.status ==
                            ApiStatus.loading,
                        function: () {
                          if (phoneController.text.isEmpty) {
                            AppToasts.showErrorToast("Enter Phone Number");
                            return;
                          }
                          loginProv.sendOtp(context,
                              phoneNumner:
                                  "+${country.dialCode}${phoneController.text}");
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
