import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/lazy_list_view.dart';
import 'package:zalada_flutter/modules/main/presenter/main_page.dart';
import 'package:zalada_flutter/modules/orders/presenter/payment_method_page.dart';
import 'package:zalada_flutter/modules/orders/widgets/button_place_order.dart';
import 'package:zalada_flutter/modules/orders/widgets/item_card.dart';
import 'package:zalada_flutter/modules/orders/widgets/item_order.dart';
import 'package:zalada_flutter/modules/product/widgets/payment_add_to_cart.dart';
import 'package:zalada_flutter/modules/profile/presenter/view_order_page.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_bottom_sheet.dart';

import 'address_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  static const routePath = '/orders';

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Order'),
      body: LazyListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Address',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        context.push(AddressPage.routePath);
                      },
                      child: Text(
                        'Edit',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.kColorBlue,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🏠 Home',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Text(
                      'Terk Thla, Sen Sok, Phnom Penh, Cambodia, 12101',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.kGreyColor,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(color: AppColors.kColorGray200, thickness: 4),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: AppSpacing.lg),
                ...List.generate(
                  3,
                  (index) => ItemOrder(
                    title: 'Apple Watch Series 9 GPS 45mm',
                    image:
                        'https://powermaccenter.com/cdn/shop/files/Apple_Watch_Series_9_GPS_45mm_Silver_Aluminum_Storm_Blue_Sport_Band_PDP_Image_Position-1__en-US_8d562dcd-6b02-4975-8a24-26b210107cec_1445x.jpg?v=1699527146',
                    price: 1999.00,
                    originalPrice: 2499.00,
                    quantity: 1,
                    index: 3 - index,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.kColorGray200, thickness: AppSpacing.xs),
          // shipping
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.md),
                InkWell(
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                  onTap: () {
                    context.push(AddressPage.routePath);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSpacing.sm),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              PhosphorIcons.truck(),
                              color: Theme.of(context).primaryColor,
                              size: AppSpacing.xlg,
                            ),
                            SizedBox(width: AppSpacing.md),
                            Text(
                              'J&T Express',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Spacer(),
                            Icon(
                              PhosphorIcons.caretRight(),
                              color: Colors.black,
                              size: AppSpacing.xlg,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Text(
                      'Delivery Time',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacer(),
                    Text(
                      'Today, 10:00 AM - 12:00 PM',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Text(
                      'Delivery Fee',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacer(),
                    Text(
                      '\$0.00',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.kColorGray200,
            thickness: AppSpacing.xs,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.md),
                PaymentAddToCart(
                  label: 'Subtotal',
                  value: 3998.00,
                ),
                PaymentAddToCart(
                  label: 'Shipping Fee',
                  value: 30.00,
                ),
                PaymentAddToCart(
                  label: 'Discount',
                  value: -100.00,
                ),
                PaymentAddToCart(
                  label: 'Total',
                  value: 3998.00,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.kColorGray200,
            thickness: AppSpacing.xs,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                ItemCard(
                  name: 'Mastercard',
                  image: 'assets/images/mastercard.png',
                  code: '**** **** 1234',
                  onPressed: () {
                    context.push(PaymentMethodPage.routePath);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonPlaceOrder(
        total: '3998.00',
        onPressed: () {
          CustomBottomSheet.successOrder(
            context,
            onGoHome: () {
              context.go(MainPage.routePath);
              pageController.jumpToPage(0);
            },
            onViewOrder: () {
              context.push(ViewOrderPage.routePath,
                extra: '1'
              );
            },
          );
        },
      ),
    );
  }
}
