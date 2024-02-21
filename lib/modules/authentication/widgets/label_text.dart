import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.kGreyColor,
          ),
    );
  }
}
