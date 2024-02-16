import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/lazy_list_view.dart';
import 'package:zalada_flutter/modules/orders/models/models_card.dart';
import 'package:zalada_flutter/modules/orders/widgets/item_card.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  static const routePath = '/payment-method';

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Method'),
      body: LazyListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  listCard.length,
                  (index) => ItemCard(
                    name: listCard[index].name,
                    image: listCard[index].image,
                    code: listCard[index].code,
                    onPressed: () {
                      selectCardPayment();
                    },
                  ),
                ),
                Text(
                  'Add New Card',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                  onTap: () {
                    selectCardPayment();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.md,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSpacing.sm),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          PhosphorIconsRegular.creditCard,
                          size: AppSpacing.xlg,
                        ),
                        SizedBox(width: AppSpacing.md),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Credit/Debit Card',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              'Add your card',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          PhosphorIconsRegular.caretRight,
                          size: AppSpacing.xlg,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void selectCardPayment() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Payment Method',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              ...List.generate(
                listCard.length,
                (index) => ItemCard(
                  name: listCard[index].name,
                  image: listCard[index].image,
                  code: listCard[index].code,
                  onPressed: () {
                    setState(() {
                      listCard.forEach((element) {
                        element.isSelect = false;
                      });
                      listCard[index].isSelect = true;
                    });
                    Navigator.pop(context);
                  },
                  isSelect: listCard[index].isSelect,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
