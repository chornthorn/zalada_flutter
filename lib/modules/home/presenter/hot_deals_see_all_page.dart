import 'package:flutter/material.dart';
import 'package:zalada_flutter/components/promotion_slider.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';

class HotDealSeeAllPage extends StatefulWidget {
  const HotDealSeeAllPage({super.key});

  static const routePath = '/hot-deal-see-all';

  @override
  State<HotDealSeeAllPage> createState() => _HotDealSeeAllPageState();
}

class _HotDealSeeAllPageState extends State<HotDealSeeAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Hot Deals'),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: AppSpacing.md),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.5),
                  ],
                ),
              ),
              child: PromotionSlider(),
            );
          },
        ),
      ),
    );
  }
}
