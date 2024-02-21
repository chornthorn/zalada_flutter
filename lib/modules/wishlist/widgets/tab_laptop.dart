import 'package:flutter/material.dart';
import 'package:zalada_flutter/modules/wishlist/models/product_wishlist.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/product_card.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class TabLaptop extends StatelessWidget {
  const TabLaptop({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _checkResponsiveCrossAxisCount(context),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: _checkResponsiveChildAspectRatio(context),
      ),
      itemCount: productWishlistLaptop.length,
      itemBuilder: (context, index) {
        final item = productWishlistLaptop[index];
        return ProductCard(
          title: item.title,
          image: item.image,
          status: item.status,
          originalPrice: item.originalPrice,
          salePrice: item.salePrice,
          type: item.type,
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
