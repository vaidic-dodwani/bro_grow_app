import 'package:bro_grow_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class PerformanceWidget extends StatelessWidget {
  const PerformanceWidget(
      {super.key, required this.title, required this.value});

  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTypography.f20w500,
        ),
        const Spacer(),
        Icon(
          value > 0 ? Icons.arrow_upward : Icons.arrow_downward,
          color: value > 0 ? Colors.green : Colors.red,
        ),
        Text(
          "$value%",
          style: AppTypography.f20w500.copyWith(
            color: value > 0 ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
