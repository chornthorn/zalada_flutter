import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ItemAddress extends StatelessWidget {
  const ItemAddress({
    super.key,
    required this.title,
    required this.address,
    required this.phone,
    this.isDefault,
    this.onPressed,
    this.onEdit,
    this.isSelected = false,
  });

  final String title;
  final String address;
  final String phone;
  final bool? isDefault;
  final bool? isSelected;
  final VoidCallback? onPressed;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.md),
            border: Border.all(
              color: isSelected!
                  ? AppColors.kOrangeColor
                  : Colors.black.withOpacity(0.1),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onPressed,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.kColorGray200,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(AppSpacing.sm),
                              child: Icon(
                                PhosphorIconsRegular.mapPinLine,
                                color: Colors.black.withOpacity(0.5),
                                size: AppSpacing.xlg,
                              ),
                            ),
                            SizedBox(width: AppSpacing.sm),
                            Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: isSelected!
                                        ? AppColors.kOrangeColor
                                        : AppColors.kColorGray500,
                                  ),
                            ),
                          ],
                        ),
                        if (isDefault != null && isDefault!)
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.8),
                              borderRadius:
                                  BorderRadius.circular(AppSpacing.xlg),
                            ),
                            child: Text(
                              'Default',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      address,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    PhosphorIcons.phone(),
                    color: Colors.black.withOpacity(0.5),
                    size: 20,
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Text(
                    phone,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: onEdit,
                    child: Text(
                      'Edit',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.kColorBlue,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
      ],
    );
  }
}
