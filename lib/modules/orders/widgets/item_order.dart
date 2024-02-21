import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ItemOrder extends StatelessWidget {
  const ItemOrder({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.index,
  });

  final String title;
  final String image;
  final double price;
  final double originalPrice;
  final int quantity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(AppSpacing.xs),
              decoration: BoxDecoration(
                color: AppColors.kColorGray200,
                borderRadius: BorderRadius.circular(AppSpacing.sm),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: AppSpacing.lg),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kBlackColor,
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            '\$$price',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.kColorBlue,
                                ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            '\$$originalPrice',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        'x$quantity',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        if (index != 1)
          Divider(
            color: AppColors.kColorGray200,
            height: 1,
          ),
        SizedBox(height: AppSpacing.sm),
      ],
    );
  }
}
