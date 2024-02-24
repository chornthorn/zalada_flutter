import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/components/promotion_slider.dart';
import 'package:zalada_flutter/components/section_title.dart';
import 'package:zalada_flutter/modules/home/presenter/hot_deals_see_all_page.dart';
import 'package:zalada_flutter/modules/home/presenter/see_all_categories_page.dart';
import 'package:zalada_flutter/modules/home/widgets/menu_categories.dart';
import 'package:zalada_flutter/modules/home/widgets/profile_home_page.dart';
import 'package:zalada_flutter/modules/home/widgets/see_more.dart';
import 'package:zalada_flutter/modules/main/presenter/main_page.dart';
import 'package:zalada_flutter/modules/notifications/pages/notification_page.dart';
import 'package:zalada_flutter/modules/wishlist/models/product_wishlist.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/product_card.dart';
import 'package:zalada_flutter/shared/models/product.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 72,
        title: ProfileHomePage(
          name: 'Rosé',
          image:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Ros%C3%A9_at_a_fan_signing_event_on_September_25%2C_2022_%28cropped%29.jpg/1200px-Ros%C3%A9_at_a_fan_signing_event_on_September_25%2C_2022_%28cropped%29.jpg',
          cartCount: 2,
          notificationCount: 3,
          onCartPressed: () {
            pageController.jumpToPage(3);
          },
          onNotificationPressed: () {
            context.push(NotificationPage.routePath);
          },
          onProfilePressed: () {
            pageController.jumpToPage(4);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SectionTitle(
                title: 'Hot deals 🔥',
                action: 'See all',
                onAction: () {
                  context.push(HotDealSeeAllPage.routePath);
                },
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 160,
                  viewportFraction: 0.9,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: Product.products.map((product) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: PromotionSlider(),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: AppSpacing.lg),
              SectionTitle(title: 'Categories'),
              SizedBox(height: AppSpacing.md),
              MenuCategories(
                onTab: () {
                  context.push(SeeAllCategoriesPage.routePath);
                },
              ),
              SectionTitle(
                title: 'New Arrivals 🚀',
                action: 'See all',
                onAction: () {
                  context.push(SeeAllCategoriesPage.routePath);
                },
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productWishlistPhone.length <= 6
                      ? productWishlistPhone.length
                      : 6,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  itemBuilder: (context, index) {
                    final item = productWishlistPhone[index];
                    //see more
                    if (index == 6 - 1 && productWishlistPhone.length > 6) {
                      return SeeMore(
                        onTap: () {
                          context.push(SeeAllCategoriesPage.routePath);
                        },
                      );
                    }
                    return ProductCard(
                      size: AppSpacing.lg,
                      title: item.title,
                      image: item.image,
                      status: item.status,
                      originalPrice: item.originalPrice,
                      salePrice: item.salePrice,
                      type: item.type,
                    );
                  },
                ),
              ),
              SectionTitle(
                title: 'Popular Products',
                action: 'See all',
                onAction: () {
                  context.push(SeeAllCategoriesPage.routePath);
                },
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productWishlistPhone.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  itemBuilder: (context, index) {
                    final item = productWishlistPhone[index];
                    return ProductCard(
                      size: AppSpacing.lg,
                      title: item.title,
                      image: item.image,
                      status: item.status,
                      originalPrice: item.originalPrice,
                      salePrice: item.salePrice,
                      type: item.type,
                    );
                  },
                ),
              ),
              SectionTitle(
                title: 'Best Deals',
                action: 'See all',
                onAction: () {
                  context.push(SeeAllCategoriesPage.routePath);
                },
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productWishlistPhone.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  itemBuilder: (context, index) {
                    final item = productWishlistPhone[index];
                    return ProductCard(
                      size: AppSpacing.lg,
                      title: item.title,
                      image: item.image,
                      status: item.status,
                      originalPrice: item.originalPrice,
                      salePrice: item.salePrice,
                      type: item.type,
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
