import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    this.title,
    required this.icon,
  });

  final String? title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xlg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
        border: Border.all(color: AppColors.kPrimaryColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.xs),
            decoration: BoxDecoration(
              color: AppColors.kColorGray300,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.kPrimaryColor,
              size: AppSpacing.xlg,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            title!,
            style: TextStyle(
              fontSize: AppSpacing.lg,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
