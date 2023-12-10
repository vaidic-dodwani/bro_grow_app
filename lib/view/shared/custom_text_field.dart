import 'package:bro_grow_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.onChanged,
      this.controller,
      this.labelText,
      this.hintText});

  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: TextInputType.number,
      style: AppTypography.f14w500,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        counterText: "",
        hintStyle: AppTypography.f14w500,
        labelText: labelText,
        hintText: hintText,
        labelStyle: AppTypography.f12w500,
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2)),
        disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2)),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2)),
      ),
    );
  }
}
