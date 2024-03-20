import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/product/models/model_detail.dart';
import 'package:zalada_flutter/modules/product/widgets/item_image.dart';
import 'package:zalada_flutter/modules/product/widgets/payment_add_to_cart.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/button_circle.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  late CarouselController carouselController;

  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  int current = 0;
  int quantity = 1;
  double price = 2000;
  double fee = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: ButtonCircle(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: modelDetailColorGrey.length,
              carouselController: carouselController,
              itemBuilder: (context, index, realIndex) {
                return ImageItem(
                  image: modelDetailColorGrey[index].image,
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
                itemCount: modelDetailColorGrey.length,
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
                          modelDetailColorGrey[index].image,
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
            Divider(
              color: AppColors.kColorGray200,
              thickness: 4,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.kColorGray100,
                          borderRadius: BorderRadius.circular(AppSpacing.md),
                        ),
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Image.network(
                          'https://resource.logitech.com/w_692,c_lpad,ar_4:3,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/logitech/en/products/mice/mx-master-3s/gallery/mx-master-3s-mouse-top-view-black.png?v=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.lg),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Logitech MX Master 3S',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              maxLines: 2,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Row(
                              children: [
                                Text(
                                  '\$$price',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.kColorBlue,
                                      ),
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                Text(
                                  '\$2,999',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: () {
                                        setState(() {
                                          if (quantity > 1) {
                                            price = price / quantity;
                                            quantity--;
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding:
                                            const EdgeInsets.all(AppSpacing.xs),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.kColorGray500,
                                          ),
                                        ),
                                        child: Icon(
                                          PhosphorIcons.minus(),
                                          size: AppSpacing.lg + 2,
                                          color: AppColors.kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: AppSpacing.md),
                                    Text('$quantity'),
                                    const SizedBox(width: AppSpacing.md),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: () {
                                        setState(() {
                                          quantity++;
                                          price = price * quantity;
                                        });
                                      },
                                      child: Container(
                                        padding:
                                            const EdgeInsets.all(AppSpacing.xs),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.kColorGray500,
                                          ),
                                        ),
                                        child: Icon(
                                          PhosphorIcons.plus(),
                                          size: AppSpacing.lg + 2,
                                          color: AppColors.kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: AppSpacing.lg),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.kColorGray200,
              thickness: 4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            PaymentAddToCart(
              label: 'Price',
              value: price,
            ),
            PaymentAddToCart(
              label: 'Delivery Fee',
              value: 10,
            ),
            PaymentAddToCart(
              label: 'Total',
              value: price + 10,
              quantity: quantity,
            ),
            const SizedBox(height: AppSpacing.md),
            CustomElevated(
              onPressed: widget.onPressed,
              text: widget.title,
            ),
            SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }
}
