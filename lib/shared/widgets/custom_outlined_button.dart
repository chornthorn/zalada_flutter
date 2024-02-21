import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.lg,
          ),
          side: BorderSide(
            color: AppColors.kColorBlue,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColors.kColorBlue,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
