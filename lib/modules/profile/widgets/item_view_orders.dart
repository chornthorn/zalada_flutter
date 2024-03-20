import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ItemViewOrders extends StatelessWidget {
  const ItemViewOrders({
    super.key,
    this.status,
    this.image,
    this.title,
    this.quantity,
  });

  final String? status;
  final String? image;
  final String? title;
  final String? quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(
          AppSpacing.md,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.kColorGray200,
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // status
          Row(
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kOrangeColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppSpacing.md),
                    bottomLeft: Radius.circular(AppSpacing.md),
                  ),
                ),
                child: Text(
                  'In Delivered',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kWhiteColor,
                      ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.sm,
            ),
            child: Row(
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
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.kBlackColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                    maxLines: 2,
                  ),
                ),
                Text(
                  'x1',
                  style: Theme.of(context).textTheme.titleMedium!,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
