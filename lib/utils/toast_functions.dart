import 'package:bro_grow_app/utils/constants/app_colors.dart';
import 'package:bro_grow_app/utils/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'routes/routes.dart';

enum AppToastsType { error, success }

class AppToasts {
  static Future showErrorToast(String message) async {
    final toast = FToast();
    toast.init(navigatorKey.currentState!.context);
    toast.showToast(
      child: _Toast(
        msg: message,
        type: AppToastsType.error,
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

  static Future showPositiveToast(String message) async {
    final toast = FToast();
    toast.init(navigatorKey.currentState!.context);
    toast.showToast(
      child: _Toast(
        msg: message,
        type: AppToastsType.success,
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }
}

class _Toast extends StatelessWidget {
  final String msg;
  final AppToastsType type;
  const _Toast({
    Key? key,
    required this.msg,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(
          28,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Icon(
              type == AppToastsType.error ? Icons.error : Icons.check,
              color: type == AppToastsType.error
                  ? AppColors.errorColor
                  : AppColors.successColor,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Center(
            child: Text(
              msg,
              style: AppTypography.f14w500.copyWith(
                  color: type == AppToastsType.error
                      ? AppColors.errorColor
                      : AppColors.successColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
