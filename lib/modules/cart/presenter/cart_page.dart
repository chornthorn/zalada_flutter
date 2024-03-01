import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/cart_item_card.dart';
import 'package:zalada_flutter/components/lazy_list_view.dart';
import 'package:zalada_flutter/modules/cart/models/cart_models.dart';
import 'package:zalada_flutter/modules/cart/presenter/cart_empty_page.dart';
import 'package:zalada_flutter/modules/cart/widgets/custom_checkout_button.dart';
import 'package:zalada_flutter/modules/orders/presenter/orders_page.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/product_card.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

import '../../wishlist/models/product_wishlist.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double total = 0;

  double calculateTotalPrice() {
    total = 0;
    for (var item in cartItems) {
      if (item.selected) {
        total += item.price;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    total = calculateTotalPrice();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text('Cart'),
        centerTitle: true,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.kColorGray200,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Icon(
              PhosphorIcons.dotsThreeVertical(),
              color: Colors.black,
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
        ),
        child: LazyListView(
          children: [
            if (cartItems.isEmpty) const CartEmptyPage(),
            if (cartItems.isNotEmpty) ...[
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
                    value: cartItems.every((element) => element.selected),
                    onChanged: (value) {
                      setState(() {
                        for (var item in cartItems) {
                          item.selected = value!;
                        }
                      });
                    },
                  ),
                  Text(
                    'Select All products',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
            ...List.generate(
              cartItems.length,
              (index) {
                final item = cartItems[index];
                return CartItemCard(
                  imageUrl: item.imageUrl,
                  title: item.title,
                  price: item.price,
                  originalPrice: item.originalPrice,
                  quantity: item.quantity,
                  onDelete: () {
                    _showDialogConfirmDelete(context, index: index);
                  },
                  selected: item.selected,
                  onDecrement: () {
                    setState(() {
                      if (item.quantity > 1) {
                        item.price = item.price / item.quantity;
                        item.quantity--;
                      }
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      item.quantity++;
                      item.price = item.price * item.quantity;
                    });
                  },
                  onSelected: (value) {
                    setState(() {
                      item.selected = value!;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: AppSpacing.xs),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppSpacing.lg,
                    bottom: AppSpacing.lg,
                  ),
                  child: Text(
                    'Related Products',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productWishlist.length,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        size: AppSpacing.lg,
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
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: cartItems.where((element) => element.selected).isNotEmpty
                ? 60
                : 0,
            child: CustomCheckoutButton(
              total: total.toString(),
              quantity: cartItems.where((element) => element.selected).length,
              onPressed: () {
                context.push(OrdersPage.routePath);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDialogConfirmDelete(
    BuildContext context, {
    required int index,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Delete Product',
              style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  'Are you sure you want to delete this item?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                removeItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
