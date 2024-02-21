import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/modules/product/presenter/product_detail_page.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.image,
    this.status,
    this.originalPrice,
    required this.salePrice,
    required this.type,
    this.size = 0,
    this.width,
  });

  final String title;
  final String image;
  final String? status;
  final String? originalPrice;
  final String salePrice;
  final int type;
  final double? size;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ProductDetailPage.routePath);
      },
      child: Container(
        margin: EdgeInsets.only(
          right: size ?? 0,
        ),
        child: Stack(
          children: [
            Container(
              width: 174,
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kGreyColor.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 6),
                  ),
                ],
                borderRadius: BorderRadius.circular(AppSpacing.lg),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 140,
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(AppSpacing.xs),
                      image: DecorationImage(
                        image: NetworkImage(
                          image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$$salePrice',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kColorBlue,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            if (originalPrice != null)
                              Text(
                                '\$$originalPrice ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.xs),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (type != 0)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: type == 1
                            ? AppColors.kRedColor
                            : type == 2
                                ? AppColors.kColorGray500
                                : AppColors.kOrangeColor,
                        borderRadius: BorderRadius.circular(AppSpacing.xxlg),
                      ),
                      child: Text(
                        status ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
