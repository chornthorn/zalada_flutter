import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/authentication/widgets/label_text.dart';
import 'package:zalada_flutter/modules/orders/presenter/orders_page.dart';
import 'package:zalada_flutter/modules/product/models/model_detail.dart';
import 'package:zalada_flutter/modules/product/widgets/add_to_cart.dart';
import 'package:zalada_flutter/modules/product/widgets/item_image.dart';
import 'package:zalada_flutter/modules/wishlist/models/product_wishlist.dart';
import 'package:zalada_flutter/modules/wishlist/widgets/product_card.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_text_form_field.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  static const routePath = '/product-detail';

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late CarouselController carouselController;
  late TextEditingController memoryController;
  late TextEditingController storageController;

  @override
  void initState() {
    super.initState();
    carouselController = CarouselController();
    memoryController = TextEditingController(text: '8GB Unified memory');
    storageController = TextEditingController(text: '256GB SSD storage');
  }

  @override
  void dispose() {
    super.dispose();
    memoryController.dispose();
    storageController.dispose();
  }

  int current = 0;
  int currentColor = 0;

  //list color
  List<Color> colors = [
    AppColors.kPrimaryColor,
    AppColors.kColorGray200,
    AppColors.kColorGray300,
    AppColors.kColorGray400,
  ];

  //list name color
  List<String> nameColors = [
    'Black',
    'Gray',
    'Silver',
    'Gold',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          onLeft: () {
            Navigator.pop(context);
          },
          onRight: () {},
          title: '',
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Icon(
                PhosphorIconsRegular.shoppingCartSimple,
                color: Colors.black.withOpacity(0.9),
                size: 20,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xxxlg,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Macbook Pro 15” 2019 - Intel core i7",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$2,399',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kColorBlue,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            '\$2,999',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: modelDetailImage.length,
                  carouselController: carouselController,
                  itemBuilder: (context, index, realIndex) {
                    return ImageItem(
                      image: modelDetailImage[index].image,
                    );
                  },
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                    },
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: modelDetailImage.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          carouselController.animateToPage(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(AppSpacing.xs),
                          margin: const EdgeInsets.only(
                            right: AppSpacing.sm,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSpacing.sm),
                            border: Border.all(
                              color: current == index
                                  ? AppColors.kPrimaryColor
                                  : AppColors.kColorGray200,
                            ),
                          ),
                          child: Image(
                            image: NetworkImage(
                              modelDetailImage[index].image,
                            ),
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xxxlg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        nameColors[currentColor],
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            colors.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentColor = index;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(AppSpacing.xxs),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: currentColor == index
                                        ? AppColors.kPrimaryColor
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(AppSpacing.md),
                                  decoration: BoxDecoration(
                                    color: colors[index],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(label: 'Memory'),
                      const SizedBox(height: AppSpacing.xs),
                      CustomTextFieldForms(
                        controller: memoryController,
                        hintText: 'Select Memory',
                        suffixIcon: PhosphorIconsRegular.caretDown,
                        onTap: () {
                          print('Select Memory');
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      LabelText(label: 'Storage'),
                      const SizedBox(height: AppSpacing.xs),
                      CustomTextFieldForms(
                        controller: storageController,
                        suffixIcon: PhosphorIconsRegular.caretDown,
                        hintText: 'Select Storage',
                        onTap: () {
                          print('Select Storage');
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Divider(
                  color: AppColors.kColorGray200,
                  thickness: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Description',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              "New variant MacBook Pro 15 2018 Intel Core i7 gen 11 with Touch Bar ID is various versions have evolved over the years.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Divider(
                  color: AppColors.kColorGray200,
                  thickness: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppSpacing.lg,
                        bottom: AppSpacing.lg,
                      ),
                      child: Text(
                        'Related Products',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productWishlist.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            size: AppSpacing.lg,
                            title: productWishlist[index].title,
                            image: productWishlist[index].image,
                            status: productWishlist[index].status,
                            originalPrice: productWishlist[index].originalPrice,
                            salePrice: productWishlist[index].salePrice,
                            type: productWishlist[index].type,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.xxxlg),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xlg,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kColorGray200,
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showBottomSheet(
                          context: context,
                          title: 'Add to cart',
                          onPressed: () {
                            context.pop();
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kRedColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.md,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.xxlg),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showBottomSheet(
                            context: context,
                            title: 'Checkout',
                            onPressed: () {
                              context.pop();
                              context.push(OrdersPage.routePath);
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.md,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.xxlg),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Buy now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet({
    required BuildContext context,
    required String title,
    required VoidCallback onPressed,
  }) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isDismissible: false,
      enableDrag: false,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 500),
      ),
      builder: (BuildContext context) {
        return AddToCart(
          title: title,
          onPressed: onPressed,
        );
      },
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
    );
  }
}
