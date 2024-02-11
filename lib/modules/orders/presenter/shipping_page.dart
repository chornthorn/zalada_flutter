import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/lazy_list_view.dart';

class ShippingPage extends StatelessWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            Text(
              'Select Address',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
          ],
        ),
      ),
      body: LazyListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            PhosphorIcons.houseLine(),
                            color: Colors.black.withOpacity(0.5),
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Home',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        'Default',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Terk Thla, Sen Sok, Phnom Penh, Cambodia, 12101',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                ),
                const SizedBox(height: 8),
                // phone
                Row(
                  children: [
                    Icon(
                      PhosphorIcons.phone(),
                      color: Colors.black.withOpacity(0.5),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '+855 12 345 678',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            PhosphorIcons.houseLine(),
                            color: Colors.black.withOpacity(0.5),
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Office',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Terk Thla, Sen Sok, Phnom Penh, Cambodia, 12101',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                ),
                const SizedBox(height: 8),
                // phone
                Row(
                  children: [
                    Icon(
                      PhosphorIcons.phone(),
                      color: Colors.black.withOpacity(0.5),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '+855 12 345 678',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
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
        child: ElevatedButton(
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Select Address'),
            ],
          ),
        ),
      ),
    );
  }
}
