import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/lazy_list_view.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

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
            Text(
              'Payment Method',
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
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                              PhosphorIcons.check(),
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                              'MasterCard **** 5678',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Spacer(),
                            Icon(
                              PhosphorIcons.check(),
                              color: Theme.of(context).primaryColor,
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
        child: ElevatedButton(
          onPressed: () {
            // Dialog
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Add New Card'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Card Number',
                          hintText: '1234 5678 9012 3456',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Card Holder',
                          hintText: 'John Doe',
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Expiry Date',
                                hintText: 'MM/YY',
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'CVV',
                                hintText: '123',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 0,
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      child: Text('Add Card'),
                    ),
                  ],
                );
              },
            );
          },
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
              Text('Add New Card'),
              SizedBox(width: 8),
              Icon(
                PhosphorIcons.plus(),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
