import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/components/lazy_list_view.dart';
import 'package:zalada_flutter/modules/orders/models/models_card.dart';
import 'package:zalada_flutter/modules/orders/widgets/item_card.dart';
import 'package:zalada_flutter/modules/profile/presenter/add_payment_page.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';

class PaymentMethodProfilePage extends StatefulWidget {
  const PaymentMethodProfilePage({super.key});

  static const routePath = '/payment-method-profile';

  @override
  State<PaymentMethodProfilePage> createState() =>
      _PaymentMethodProfilePageState();
}

class _PaymentMethodProfilePageState extends State<PaymentMethodProfilePage> {
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
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: AppSpacing.xlg,
          right: AppSpacing.xlg,
          bottom: AppSpacing.xxlg,
        ),
        child: CustomElevated(
          text: 'Add New Card',
          onPressed: () {
            selectCardPayment();
          },
        ),
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
                'Add Payment Method',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              ...List.generate(
                listCardAdd.length,
                (index) => ItemCard(
                  name: listCardAdd[index].name,
                  image: listCardAdd[index].image,
                  code: listCardAdd[index].code,
                  onPressed: () {
                    setState(() {
                      for (var element in listCardAdd) {
                        element.isSelect = false;
                      }
                      listCardAdd[index].isSelect = true;
                    });
                    Navigator.pop(context);
                    context.push(AddPaymentPage.routePath);
                  },
                  isSelect: listCardAdd[index].isSelect,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
