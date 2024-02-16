import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class CustomElevated extends StatelessWidget {
  const CustomElevated({
    required this.text,
    super.key,
    this.onPressed,
    this.child,
    this.width = double.infinity,
    this.icon,
  });

  final String text;
  final VoidCallback? onPressed;
  final Widget? child;
  final double? width;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.xxlg),
          ),
          shadowColor: BoxShadow(
            color: AppColors.kBlackColor.withOpacity(0.8),
            blurRadius: AppSpacing.sm,
            offset: const Offset(0, 9),
          ).color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.kWhiteColor,
                  ),
            ),
            child ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
