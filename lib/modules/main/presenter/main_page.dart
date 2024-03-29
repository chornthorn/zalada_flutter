import 'dart:io';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/bottom_nav_item.dart';
import 'package:zalada_flutter/modules/home/presenter/home_page.dart';
import 'package:animations/animations.dart';
import 'package:zalada_flutter/modules/profile/presenter/profile_page.dart';

import '../../cart/presenter/cart_page.dart';
import '../../search/presenter/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin<MainPage> {
  int selectedIndex = 0;

  final _pages = <Widget>[
    const HomePage(),
    const SearchPage(),
    const Placeholder(),
    const CartPage(),
    const ProfilePage(),
  ];

  final bottomNavItems = [
    {
      'icon': PhosphorIcons.houseSimple(),
      'label': 'Home',
    },
    {
      'icon': PhosphorIcons.magnifyingGlass(),
      'label': 'Search',
    },
    {
      'icon': PhosphorIcons.heart(),
      'label': 'Wishlist',
      'badge': true,
    },
    {
      'icon': PhosphorIcons.shoppingBag(),
      'label': 'Cart',
      'badge': true,
    },
    {
      'icon': PhosphorIcons.user(),
      'label': 'Profile',
    },
  ];

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        padding: EdgeInsets.zero,
        height: Platform.isIOS ? 65 : 75,
        child: Padding(
          padding: EdgeInsets.only(
            right: 16,
            left: 16,
            top: 10,
            bottom: Platform.isIOS ? 0 : 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              bottomNavItems.length,
              (index) {
                final item = bottomNavItems[index];
                return BottomNavItem(
                  icon: item['icon'] as IconData,
                  selected: selectedIndex == index,
                  label: item['label'] as String,
                  badgeCount: item['badge'] == true && index == 3 ? 2 : 0,
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                      _pageController.jumpToPage(index);
                    });
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
