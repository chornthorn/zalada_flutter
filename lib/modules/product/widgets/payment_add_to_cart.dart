import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';

class PaymentAddToCart extends StatelessWidget {
  const PaymentAddToCart({
    super.key,
    required this.label,
    required this.value,
    this.quantity,
  });

  final String label;
  final double value;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.kGreyColor,
                ),
          ),
          if (quantity != null)
            Text(
              ' (x$quantity Items)',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.kBlackColor,
                  ),
            ),
          Spacer(),
          Text(
            '\$$value',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.kBlackColor,
                ),
          ),
        ],
      ),
    );
  }
}
