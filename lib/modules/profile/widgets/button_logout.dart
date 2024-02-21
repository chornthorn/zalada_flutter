import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ButtonLogOut extends StatelessWidget {
  const ButtonLogOut({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xs,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.kColorGray200,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  PhosphorIconsRegular.signOut,
                  color: AppColors.kRedColor,
                  size: AppSpacing.xlg,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Text(
                'Logout',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.kRedColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
