import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/custom_tab.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/tab_all.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/tab_laptop.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/tab_phone.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_text_form_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _searchController;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.grey[50],
        automaticallyImplyLeading: false,
        title: Container(
          margin: const EdgeInsets.only(
            top: AppSpacing.sm,
          ),
          child: CustomTextFieldForms(
            controller: _searchController,
            hintText: 'Search for products',
            prefixIcon: Icon(
              PhosphorIconsRegular.magnifyingGlass,
              color: Colors.grey,
              size: AppSpacing.xlg,
            ),
            suffixIcon: PhosphorIconsRegular.x,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSpacing.sm),
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
                    title: 'Clothes',
                    icon: PhosphorIconsBold.tShirt,
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
