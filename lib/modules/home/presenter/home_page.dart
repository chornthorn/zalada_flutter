import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/bottom_nav_item.dart';
import 'package:zalada_flutter/components/lazy_list_view.dart';
import 'package:zalada_flutter/components/product_card.dart';
import 'package:zalada_flutter/components/promotion_slider.dart';
import 'package:zalada_flutter/components/section_title.dart';
import 'package:zalada_flutter/shared/models/category.dart';
import 'package:zalada_flutter/shared/models/product.dart';

import '../../product/presenter/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
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
                  label: null,
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
        child: LazyListView(
          cacheExtent: 1500,
          children: [
            // host deals slider
            SectionTitle(
              title: 'Hot deals 🔥',
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
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 16 : 0,
                      right: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 80,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            categories[index].icon,
                            color: Theme.of(context).primaryColor,
                            size: 25,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          categories[index].name,
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SectionTitle(
              title: 'New Arrivals 🚀',
              action: 'See all',
              onAction: () {
                print('See all');
                final route = MaterialPageRoute(
                  builder: (context) => ProductPage(),
                );
                Navigator.push(context, route);
              },
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Product.products.length,
                itemBuilder: (context, index) {
                  final product = Product.products[index];
                  return ProductCard(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 16 : 0,
                      right: 16,
                    ),
                    name: product.name,
                    imageUrl: product.imageUrl,
                    originalPrice: product.originalPrice,
                    salePrice: product.salePrice,
                    rating: product.rating,
                    ratingCount: product.ratingCount,
                    soldCount: product.soldCount,
                    discount: product.discount,
                  );
                },
              ),
            ),
            SectionTitle(
              title: 'Popular Products',
              action: 'See all',
              onAction: () {
                print('See all');
              },
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Product.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 16 : 0,
                      right: 16,
                    ),
                    name: Product.products[index].name,
                    imageUrl: Product.products[index].imageUrl,
                    originalPrice: Product.products[index].originalPrice,
                    salePrice: Product.products[index].salePrice,
                    rating: Product.products[index].rating,
                    ratingCount: Product.products[index].ratingCount,
                    soldCount: Product.products[index].soldCount,
                    discount: Product.products[index].discount,
                  );
                },
              ),
            ),
            SectionTitle(
              title: 'Best Deals',
              action: 'See all',
              onAction: () {
                print('See all');
              },
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Product.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 16 : 0,
                      right: 16,
                    ),
                    name: Product.products[index].name,
                    imageUrl: Product.products[index].imageUrl,
                    originalPrice: Product.products[index].originalPrice,
                    salePrice: Product.products[index].salePrice,
                    rating: Product.products[index].rating,
                    ratingCount: Product.products[index].ratingCount,
                    soldCount: Product.products[index].soldCount,
                    discount: Product.products[index].discount,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
