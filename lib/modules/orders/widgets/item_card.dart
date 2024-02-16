import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.name,
    required this.image,
    required this.code,
    this.onPressed,
    this.isSelect = false,
  });

  final String name;
  final String image;
  final String code;
  final VoidCallback? onPressed;
  final bool? isSelect;

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
                    Image(
                      image: AssetImage(image),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: AppSpacing.md),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          code,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    Spacer(),
                    if (isSelect == true)
                      Icon(
                        PhosphorIcons.check(),
                        color: AppColors.kOrangeColor,
                        size: AppSpacing.xlg,
                      ),
                    if (isSelect == false)
                      Icon(
                        PhosphorIcons.caretRight(),
                        color: Colors.black,
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
