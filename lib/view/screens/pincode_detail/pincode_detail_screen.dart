import 'package:bro_grow_app/utils/toast_functions.dart';
import 'package:bro_grow_app/view/shared/custom_button.dart';
import 'package:bro_grow_app/view/shared/custom_text_field.dart';
import 'package:bro_grow_app/view_model/pincode_details_view_model/pincode_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/app_constants.dart';

class PincodeDetailScreen extends StatefulWidget {
  const PincodeDetailScreen({super.key});

  @override
  State<PincodeDetailScreen> createState() => _PincodeDetailScreenState();
}

class _PincodeDetailScreenState extends State<PincodeDetailScreen> {
  late final TextEditingController pinCodeController;

  @override
  void initState() {
    pinCodeController = TextEditingController();
    super.initState();
  }

  final List<String> dropDownEntries = ['HealthCare'];

  final border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Consumer<PincodeProvider>(
            builder: (context, pincodeProv, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                const Text("Enter Pincode and category",
                    textAlign: TextAlign.left, style: AppTypography.f24w700),
                const SizedBox(height: 30),
                const Text("Pincode",
                    textAlign: TextAlign.left, style: AppTypography.f14w400),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: pinCodeController,
                  hintText: "Pincode",
                  labelText: "Pincode",
                  onChanged: (value) {
                    pincodeProv.pincode = value;
                    if (value.length == 6) {
                      pincodeProv.autoFillCityState(context, value);
                    }
                  },
                ),
                const SizedBox(height: 30),
                const Text("Category",
                    textAlign: TextAlign.left, style: AppTypography.f14w400),
                const SizedBox(height: 10),
                DropdownMenu(
                  hintText: "Category",
                  width: MediaQuery.sizeOf(context).width - 32,
                  textStyle: AppTypography.f16w500,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: AppTypography.f14w400,
                    border: border,
                    errorBorder: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    disabledBorder: border,
                    focusedErrorBorder: border,
                  ),
                  onSelected: (value) {
                    if (value != null) {
                      pincodeProv.category = value;
                    }
                  },
                  dropdownMenuEntries: List.generate(
                    dropDownEntries.length,
                    (index) => DropdownMenuEntry(
                      value: dropDownEntries[index],
                      label: dropDownEntries[index],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                if (pincodeProv.state.isNotEmpty || pincodeProv.city.isNotEmpty)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "State: ${pincodeProv.state}",
                          style: AppTypography.f14w400,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                          child: Text("City: ${pincodeProv.city}",
                              style: AppTypography.f14w400,
                              textAlign: TextAlign.center)),
                    ],
                  ),
                const SizedBox(height: 30),
                CustomButton(
                    buttonText: "Continue",
                    function: () {
                      if (pincodeProv.city.isEmpty ||
                          pincodeProv.state.isEmpty ||
                          pincodeProv.pincode.isEmpty ||
                          pincodeProv.category.isEmpty) {
                        AppToasts.showErrorToast("Fill All Fields");
                      } else {
                        pincodeProv.saveDetails(context);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
