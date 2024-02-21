import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.kColorGray200,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'My Orders',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: onTap,
                child: Text(
                  'See all',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.kColorBlue,
                      ),
                ),
              )
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.circular(
                AppSpacing.md,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kColorGray200,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Order ID ',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.kGreyColor,
                          ),
                    ),
                    Text(
                      '0098767877',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.kBlackColor,
                          ),
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kOrangeColor,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.xxxlg,
                        ),
                      ),
                      child: Text(
                        'In Delivered',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.kWhiteColor,
                                ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Divider(
                  color: AppColors.kColorGray500,
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.xs),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.md,
                        ),
                      ),
                      child: Image.network(
                        'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MT5H3_VW_34FR+watch-case-45-aluminum-silver-nc-s9_VW_34FR+watch-face-45-aluminum-silver-s9_VW_34FR_WF_CO_GEO_GB?wid=752&hei=720&bgc=fafafa&trim=1&fmt=p-jpg&qlt=80&.v=ZVdzMmdqOFY5V2g2UUpEQldHQm1DS2c4WVhrTUNGaFJqVEpXMnB1Zy83d3ZBUXVDSWtueGFFWmRtanJVdndvV3l2M3JFSzgxeU4xYVE5dnVNZmdENng0ei9FYzZxSEVsdVptY0xJV2JFeThFK0VwOUdLVWtzTXc2dDNHRmlIN2trdWh6RzZvNXgwaTlHSkQremtJaWFFT3Q5bWJxRDV6WWlibW1oTWd1Z1crckJnajVCaGRzU0pBREM1Q082Uk51NXVkZ2t0VWxQK2o2M01obVdMRmRjcEQ5ZE5GWVJXWDlCeFdkMXJ2VCtMS2YyM1VRRS9pbjVnd0lzQ2J6L3dZcA',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Flexible(
                      child: Text(
                        'iWatches 9 GPS 45mm Silver Aluminum',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.kBlackColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                        maxLines: 2,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(
                        AppSpacing.xxxlg,
                      ),
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppSpacing.xxxlg,
                          ),
                          border: Border.all(
                            color: AppColors.kColorGray500,
                          ),
                        ),
                        child: Text(
                          'Track Order',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.kBlackColor,
                                  ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
