import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/custom_tab.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/tab_all.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/tab_laptop.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/tab_phone.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'YourWishlist',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryColor,
              ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 44,
            child: TabBar(
              indicatorPadding: EdgeInsets.zero,
              splashBorderRadius: BorderRadius.circular(AppSpacing.sm),
              isScrollable: true,
              controller: tabController,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              tabAlignment: TabAlignment.start,
              indicator: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(AppSpacing.sm),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.kWhiteColor,
              unselectedLabelColor: AppColors.kPrimaryColor,
              labelStyle: const TextStyle(
                fontSize: AppSpacing.lg,
                fontWeight: FontWeight.w600,
                color: AppColors.kWhiteColor,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: AppSpacing.lg,
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryColor,
              ),
              tabs: [
                Tab(
                  child: CustomTab(
                    title: 'All',
                    icon: PhosphorIconsBold.dotsNine,
                  ),
                ),
                Tab(
                  child: CustomTab(
                    title: 'Laptop💻',
                    icon: PhosphorIconsBold.laptop,
                  ),
                ),
                Tab(
                  child: CustomTab(
                    title: 'Phone📱',
                    icon: PhosphorIconsBold.phone,
                  ),
                ),
                Tab(
                  child: CustomTab(
                    title: 'Electronics',
                    icon: PhosphorIconsBold.circuitry,
                  ),
                ),
                Tab(
                  child: CustomTab(
                    title: 'Clothes',
                    icon: PhosphorIconsBold.sneaker,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                TabAll(),
                TabLaptop(),
                TabPhone(),
                TabLaptop(),
                TabLaptop(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
