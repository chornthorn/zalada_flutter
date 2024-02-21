import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zalada_flutter/modules/wishlist/models/product_wishlist.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/product_card.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class TabAllHome extends StatelessWidget {
  const TabAllHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: _checkResponsiveCrossAxisCount(context),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
      ),
      primary: false,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemCount: productWishlist.length,
      itemBuilder: (context, index) {
        return ProductCard(
          title: productWishlist[index].title,
          image: productWishlist[index].image,
          status: productWishlist[index].status,
          originalPrice: productWishlist[index].originalPrice,
          salePrice: productWishlist[index].salePrice,
          type: productWishlist[index].type,
        );
      },
    );
  }

  double _checkResponsiveChildAspectRatio(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return 0.74;
    } else if (MediaQuery.of(context).size.width < 900) {
      return 0.78;
    } else {
      return 0.6;
    }
  }

  int _checkResponsiveCrossAxisCount(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return 2;
    } else if (MediaQuery.of(context).size.width < 900) {
      return 4;
    } else {
      return 4;
    }
  }
}
