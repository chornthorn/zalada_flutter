import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ItemNotification extends StatelessWidget {
  const ItemNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
        onTap: () {},
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.kColorGray200,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/discount.svg',
                    width: AppSpacing.xxlg,
                    height: AppSpacing.xxlg,
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discount 50% for all product   sfg    ertg',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                        maxLines: 1,
                      ),
                      Text(
                        'Get discount 50% for all product in Zalada',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.kColorGray500,
                              overflow: TextOverflow.ellipsis,
                            ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            Divider(
              color: AppColors.kColorGray300,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
