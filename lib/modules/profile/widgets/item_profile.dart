import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing,
  });

  final String title;
  final IconData icon;
  final Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(
              left: AppSpacing.md,
              right: AppSpacing.md,
              top: AppSpacing.sm,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: AppColors.kColorGray200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.kBlackColor,
                        size: AppSpacing.xlg,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                    ),
                    const Spacer(),
                    trailing ?? const SizedBox(),
                    if (trailing == null)
                      Icon(
                        PhosphorIconsRegular.caretRight,
                        color: AppColors.kBlackColor,
                        size: AppSpacing.xlg,
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm - 2),
                const Divider(
                  color: AppColors.kColorGray300,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
