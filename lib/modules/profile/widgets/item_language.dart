import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ItemLanguage extends StatelessWidget {
  const ItemLanguage({
    super.key,
    required this.name,
    this.onPressed,
    this.isSelect = false,
    required this.logo,
  });

  final String name;
  final VoidCallback? onPressed;
  final bool? isSelect;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(AppSpacing.sm),
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.sm),
              border: Border.all(
                color: isSelect == true
                    ? AppColors.kOrangeColor
                    : AppColors.kColorGray300,
                width: 1,
              ),
            ),
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kColorGray300,
                      ),
                      child: Text(logo, style: TextStyle(fontSize: 22)),
                    ),
                    SizedBox(width: AppSpacing.md),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Spacer(),
                    if (isSelect == true)
                      Icon(
                        PhosphorIconsFill.checkCircle,
                        color: AppColors.kOrangeColor,
                        size: AppSpacing.xlg,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: AppSpacing.md),
      ],
    );
  }
}
