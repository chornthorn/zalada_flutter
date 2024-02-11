import 'package:flutter/material.dart';
import 'package:zalada_flutter/components/product_card.dart';
import 'package:zalada_flutter/shared/models/product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      // product grid
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: Product.products.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return ProductCard(
            name: Product.products[index].name,
            imageUrl: 'https://picsum.photos/200/300?random=$index',
            originalPrice: Product.products[index].originalPrice,
            salePrice: Product.products[index].salePrice,
            rating: Product.products[index].rating,
            ratingCount: Product.products[index].ratingCount,
            soldCount: Product.products[index].soldCount,
            discount: Product.products[index].discount,
          );
        },
      ),
    );
  }
}
