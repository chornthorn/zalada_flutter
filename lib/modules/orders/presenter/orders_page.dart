import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/lazy_list_view.dart';

import 'payment_method_page.dart';
import 'shipping_page.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  PhosphorIcons.arrowLeft(),
                  color: Colors.black.withOpacity(0.9),
                  size: 20,
                ),
              ),
            ),
            Spacer(),
            Text('Orders'),
            Spacer(),
          ],
        ),
      ),
      body: LazyListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
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
                      style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        final route = MaterialPageRoute(
                          builder: (context) => ShippingPage(),
                        );
                        Navigator.push(context, route);
                      },
                      child: Text(
                        'Edit',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
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
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Terk Thla, Sen Sok, Phnom Penh, Cambodia, 12101',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black.withOpacity(0.9),
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: EdgeInsets.all(20),
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
                SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Macbook Pro 15” 2019 - Intel core i7 - Grey',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '\$1,999.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '\$2,499.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Colors.black.withOpacity(0.5),
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                'x1',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Divider(
                  color: Colors.grey.withOpacity(0.2),
                  height: 1,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Macbook Pro 15” 2019 - Intel core i7 - Grey',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '\$1,999.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '\$2,499.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Colors.black.withOpacity(0.5),
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                'x1',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // shipping
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    final route = MaterialPageRoute(
                      builder: (context) => ShippingPage(),
                    );
                    Navigator.push(context, route);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              PhosphorIcons.truck(),
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                            SizedBox(width: 16),
                            Text(
                              'J&T Express',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Spacer(),
                            Icon(
                              PhosphorIcons.caretRight(),
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 8),
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
          const SizedBox(height: 4),
          // payment summary
          Container(
            padding: EdgeInsets.all(20),
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Subtotal',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacer(),
                    Text(
                      '\$3,998.00',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Shipping Fee',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacer(),
                    Text(
                      '\$0.00',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Discount',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacer(),
                    Text(
                      '-\$100.00',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Spacer(),
                    Text(
                      '\$3,898.00',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // payment method
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    final route = MaterialPageRoute(
                      builder: (context) => PaymentMethodPage(),
                    );
                    Navigator.push(context, route);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              PhosphorIcons.creditCard(),
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Visa **** 1234',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Spacer(),
                            Icon(
                              PhosphorIcons.caretRight(),
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 32,
          right: 32,
          bottom: 32,
          top: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: Offset(0, -1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              'Total: \$3,898.00',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Row(
                children: [
                  Text('Place Order'),
                  SizedBox(width: 8),
                  Icon(
                    PhosphorIcons.arrowRight(),
                    size: 20,
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
