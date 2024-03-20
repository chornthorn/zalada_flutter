import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/modules/main/presenter/main_page.dart';
import 'package:zalada_flutter/modules/profile/widgets/invoice_and_receipt.dart';
import 'package:zalada_flutter/modules/profile/widgets/item_view_orders.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';

class ViewOrderPage extends StatefulWidget {
  const ViewOrderPage({super.key, required this.type});

  final String type;

  static const String routePath = '/view-order';

  @override
  State<ViewOrderPage> createState() => _ViewOrderPageState();
}

class _ViewOrderPageState extends State<ViewOrderPage> {
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'View Order',
        onLeft: () {
          if (widget.type == '1') {
            context.go(MainPage.routePath);
            pageController.jumpToPage(0);
          } else {
            context.pop();
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InvoiceAndReceipt(
              invoice: 'INV/37662/7899',
              receiptNumber: '37893278761',
              isCopied: isCopied,
              onTap: () {
                Clipboard.setData(
                  ClipboardData(text: '37893278761'),
                );
                setState(() {
                  isCopied = true;
                });
              },
            ),
            const SizedBox(height: AppSpacing.xlg),
            Divider(
              color: AppColors.kColorGray200,
              thickness: 4,
            ),
            SizedBox(height: AppSpacing.xlg),
            ...List.generate(
              2,
              (index) => ItemViewOrders(),
            ),
          ],
        ),
      ),
    );
  }
}
