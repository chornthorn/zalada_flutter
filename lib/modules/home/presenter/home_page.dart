import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/promotion_slider.dart';
import 'package:zalada_flutter/components/section_title.dart';
import 'package:zalada_flutter/modules/home/widgets/tab_all_home.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
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
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/43.jpg',
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back,',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'John Doe',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Badge(
                  label: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      PhosphorIcons.shoppingCartSimple(),
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Badge(
                  label: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      PhosphorIcons.bellSimple(),
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            )
          ],
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
                  print('See all');
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
