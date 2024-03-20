import 'package:flutter/material.dart';
import 'package:zalada_flutter/modules/wishlist/models/product_wishlist.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/product_card.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';

class SeeAllCategoriesPage extends StatefulWidget {
  const SeeAllCategoriesPage({super.key});

  static const routePath = '/see-all-categories';

  @override
  State<SeeAllCategoriesPage> createState() => _SeeAllCategoriesPageState();
}

class _SeeAllCategoriesPageState extends State<SeeAllCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'New Arrivals 🚀'),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(AppSpacing.lg),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _checkResponsiveCrossAxisCount(context),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: _checkResponsiveChildAspectRatio(context),
          ),
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
        ),
      ),
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
