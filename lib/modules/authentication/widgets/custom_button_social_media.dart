import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class CustomButtonSocialMedia extends StatelessWidget {
  const CustomButtonSocialMedia({
    super.key,
    this.onTap,
    required this.text,
    required this.icon,
  });

  final VoidCallback? onTap;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSpacing.xxlg),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.xlg,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.kGreyColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.xxlg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              icon,
              height: AppSpacing.xlg,
              width: AppSpacing.xlg,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.kBlackColor,
                  ),
            ),
            SizedBox(width: AppSpacing.sm),
          ],
        ),
      ),
    );
  }
}
