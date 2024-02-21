import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/components/promotion_slider.dart';
import 'package:zalada_flutter/components/section_title.dart';
import 'package:zalada_flutter/modules/home/widgets/profile_home_page.dart';
import 'package:zalada_flutter/modules/home/widgets/tab_all_home.dart';
import 'package:zalada_flutter/modules/main/presenter/main_page.dart';
import 'package:zalada_flutter/modules/notifications/pages/notification_page.dart';
import 'package:zalada_flutter/shared/models/product.dart';

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
                title: 'Hot Deals',
                action: 'See all',
                onAction: () {
                  pageController.jumpToPage(1);
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
              SectionTitle(
                title: 'Categories',
                action: 'See all',
                onAction: () {
                  print('See all');
                },
              ),
              TabAllHome(),
            ],
          ),
        ),
      ),
    );
  }
}
