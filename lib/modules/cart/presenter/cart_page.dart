import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/cart_item_card.dart';
import 'package:zalada_flutter/components/lazy_list_view.dart';
import 'package:zalada_flutter/components/product_card.dart';
import 'package:zalada_flutter/shared/models/product.dart';

import '../../orders/presenter/orders_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cart'),
        centerTitle: true,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              PhosphorIcons.dotsThreeVertical(),
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: LazyListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                CartItemCard(
                  imageUrl: 'https://picsum.photos/200/300',
                  title: 'Macbook Pro 15” 2019 - Intel core i7',
                  price: 1200,
                  originalPrice: 2499,
                  quantity: 1,
                  onQuantityChanged: (value) {},
                  onDelete: () {},
                  selected: true,
                ),
                const SizedBox(height: 16),
                Divider(
                  height: 0,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 16),
                CartItemCard(
                  imageUrl: 'https://picsum.photos/200/300',
                  title: 'Macbook Pro 15” 2019 - Intel core i7',
                  price: 1399,
                  originalPrice: 2499,
                  quantity: 1,
                  onQuantityChanged: (value) {},
                  onDelete: () {},
                  selected: false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // related products
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 10,
                ),
                margin: EdgeInsets.only(
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Text(
                      'Related Products',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Product.products.length,
                  itemBuilder: (context, index) {
                    final product = Product.products[index];
                    return ProductCard(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 16 : 0,
                        right: 16,
                      ),
                      name: product.name,
                      imageUrl: product.imageUrl,
                      originalPrice: product.originalPrice,
                      salePrice: product.salePrice,
                      rating: product.rating,
                      ratingCount: product.ratingCount,
                      soldCount: product.soldCount,
                      discount: product.discount,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ElevatedButton(
          onPressed: () {
            final route = MaterialPageRoute(
              builder: (context) => const OrdersPage(),
            );
            Navigator.push(context, route);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Checkout"),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '2',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                PhosphorIcons.arrowRight(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
