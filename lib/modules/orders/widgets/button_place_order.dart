import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ButtonPlaceOrder extends StatelessWidget {
  const ButtonPlaceOrder({
    super.key,
    required this.total,
    required this.onPressed,
  });

  final String total;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppSpacing.xlg,
        right: AppSpacing.xlg,
        bottom: AppSpacing.xxlg,
        top: AppSpacing.sm,
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
            'Total: \$$total',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Spacer(),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.xlg,
                vertical: AppSpacing.md,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.xxlg),
              ),
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: Row(
              children: [
                Text('Place Order'),
                SizedBox(width: AppSpacing.sm),
                Icon(
                  PhosphorIcons.arrowRight(),
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
