import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/product/presenter/product_detail_page.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

import '../shared/widgets/number_animated.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.onDelete,
    required this.selected,
    required this.onDecrement,
    required this.onIncrement,
    this.onSelected,
    this.index,
  });

  final String imageUrl;
  final String title;
  final double price;
  final double originalPrice;
  final int quantity;
  final Function() onDelete;
  final Function(bool? value)? onSelected;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final bool selected;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppSpacing.md,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                splashRadius: AppSpacing.lg,
                activeColor: AppColors.kOrangeColor,
                side: BorderSide(
                  color: AppColors.kColorGray500,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.xs),
                ),
                value: selected,
                onChanged: onSelected,
              ),
              InkWell(
                onTap: () {
                  context.push(ProductDetailPage.routePath);
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.kColorGray100,
                    borderRadius: BorderRadius.circular(AppSpacing.md),
                  ),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Text(
                          '\$$price',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          '\$$originalPrice',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: onDecrement,
                              child: Container(
                                padding: const EdgeInsets.all(AppSpacing.xs),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.kColorGray500,
                                  ),
                                ),
                                child: Icon(
                                  PhosphorIcons.minus(),
                                  size: AppSpacing.lg + 2,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.md),
                            NumberAnimated(quantity: quantity),
                            const SizedBox(width: AppSpacing.md),
                            InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: onIncrement,
                              child: Container(
                                padding: const EdgeInsets.all(AppSpacing.xs),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.kColorGray500,
                                  ),
                                ),
                                child: Icon(
                                  PhosphorIcons.plus(),
                                  size: AppSpacing.lg + 2,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // delete button
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: onDelete,
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.xs),
                            decoration: BoxDecoration(
                              color: AppColors.kColorGray100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              PhosphorIcons.trashSimple(),
                              color: Colors.redAccent,
                              size: AppSpacing.xlg,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppSpacing.lg),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Divider(
            color: AppColors.kColorGray300,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
