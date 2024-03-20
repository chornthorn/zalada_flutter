import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class InvoiceAndReceipt extends StatelessWidget {
  const InvoiceAndReceipt({
    super.key,
    this.onTap,
    this.invoice,
    this.receiptNumber,
    this.isCopied = false,
  });

  final bool? isCopied;
  final VoidCallback? onTap;
  final String? invoice;
  final String? receiptNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Invoice',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kGreyColor,
                    ),
              ),
              const Spacer(),
              Text(
                invoice!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kBlackColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Text(
                'Receipt Number',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kGreyColor,
                    ),
              ),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(AppSpacing.xs),
                onTap: onTap,
                child: Row(
                  children: [
                    Text(
                      receiptNumber!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.kBlackColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(width: AppSpacing.xs),
                    Icon(
                      isCopied!
                          ? PhosphorIconsRegular.checks
                          : PhosphorIconsRegular.copy,
                      color: AppColors.kBlackColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
