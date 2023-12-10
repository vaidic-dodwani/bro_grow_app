import 'package:bro_grow_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool isLoading;
  final bool isOutlined;
  final VoidCallback? function;
  final bool showBorder;
  final IconData? icon;
  final double? height;
  final TextStyle buttonTextStyle;
  const CustomButton(
      {super.key,
      this.isOutlined = false,
      required this.buttonText,
      required this.function,
      this.isLoading = false,
      this.showBorder = true,
      this.icon,
      this.height = 50,
      this.buttonTextStyle = AppTypography.f16w500});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: showBorder
              ? isOutlined
                  ? Border.all(color: AppColors.primaryColor)
                  : null
              : null,
          color: isOutlined ? AppColors.defaultWhite : AppColors.primaryColor,
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: isOutlined
                        ? AppColors.primaryColor
                        : AppColors.defaultWhite,
                    strokeWidth: 3,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Icon(
                      icon,
                      color: isOutlined
                          ? AppColors.primaryColor
                          : AppColors.defaultWhite,
                    ),
                  if (icon != null) const SizedBox(width: 10),
                  Text(
                    textAlign: TextAlign.center,
                    buttonText,
                    style: buttonTextStyle.copyWith(
                      color: isOutlined
                          ? AppColors.primaryColor
                          : AppColors.defaultWhite,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
