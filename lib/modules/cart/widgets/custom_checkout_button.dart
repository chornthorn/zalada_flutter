import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class CustomCheckoutButton extends StatelessWidget {
  const CustomCheckoutButton({
    super.key,
    required this.total,
    this.onPressed,
    this.quantity,
  });

  final String total;
  final int? quantity;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
      ),
      child: Row(
        children: [
          Text(
            'Total: \$$total',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const Spacer(),
          InkWell(
            splashColor: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.xxlg),
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xxxlg,
                vertical: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(AppSpacing.xxlg),
              ),
              child: Row(
                children: [
                  Text(
                    'Checkout',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
                  if (quantity != 0)
                    Container(
                      margin: const EdgeInsets.only(left: AppSpacing.xs),
                      padding: const EdgeInsets.all(AppSpacing.xs),
                      decoration: BoxDecoration(
                        color: AppColors.kGreyColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        quantity!.toString(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
