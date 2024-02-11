import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/components/product_card.dart';
import 'package:zalada_flutter/shared/models/category.dart';
import 'package:zalada_flutter/shared/models/product.dart';

import '../../../components/lazy_list_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          child: TextField(
            controller: _searchController,
            onTapOutside: (value) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              hintText: 'Search laptop, phone, ...',
              hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              prefixIcon: Icon(
                PhosphorIcons.magnifyingGlass(),
                color: Colors.grey,
              ),
              // clear icon if the search field is not empty
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: Icon(
                        PhosphorIcons.x(),
                        color: Colors.grey,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: LazyListView(
          cacheExtent: 1500,
          children: [
            const SizedBox(height: 16),
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
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: Product.products.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return ProductCard(
                  name: Product.products[index].name,
                  imageUrl: 'https://picsum.photos/200/300?random=$index',
                  originalPrice: Product.products[index].originalPrice,
                  salePrice: Product.products[index].salePrice,
                  rating: Product.products[index].rating,
                  ratingCount: Product.products[index].ratingCount,
                  soldCount: Product.products[index].soldCount,
                  discount: Product.products[index].discount,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
