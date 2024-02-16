import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/orders/presenter/shipping_page.dart';
import 'package:zalada_flutter/modules/profile/models/model_language.dart';
import 'package:zalada_flutter/modules/profile/presenter/edite_profile_page.dart';
import 'package:zalada_flutter/modules/profile/presenter/payment_method.dart';
import 'package:zalada_flutter/modules/profile/widgets/button_logout.dart';
import 'package:zalada_flutter/modules/profile/widgets/item_language.dart';
import 'package:zalada_flutter/modules/profile/widgets/item_profile.dart';
import 'package:zalada_flutter/modules/profile/widgets/my_order.dart';
import 'package:zalada_flutter/modules/profile/widgets/my_profile.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSwitched = false;
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBackgroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: AppSpacing.xxlg),
            Text(
              'Profile',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                context.push(EditeProfilePage.routePath);
              },
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
                  PhosphorIconsRegular.pencilSimpleLine,
                  color: Colors.black.withOpacity(0.9),
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyProfile(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Ros%C3%A9_at_a_fan_signing_event_on_September_25%2C_2022_%28cropped%29.jpg/1200px-Ros%C3%A9_at_a_fan_signing_event_on_September_25%2C_2022_%28cropped%29.jpg',
              name: 'Rose',
              email: 'rose@gmail.com',
            ),
            const SizedBox(height: AppSpacing.lg),
            MyOrders(
              onTap: () {},
            ),
            SizedBox(height: AppSpacing.xs),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Settings',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.kGreyColor,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  ItemProfile(
                    title: 'Address',
                    icon: PhosphorIconsRegular.mapPin,
                    onTap: () {
                      context.push(AddressPage.routePath);
                    },
                  ),
                  ItemProfile(
                    title: 'PaymentMethod',
                    icon: PhosphorIconsRegular.creditCard,
                    onTap: () {
                      context.push(PaymentMethodProfilePage.routePath);
                    },
                  ),
                  ItemProfile(
                    title: 'Notification',
                    icon: PhosphorIconsRegular.bell,
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ),
                  ItemProfile(
                    title: 'Account Security',
                    icon: PhosphorIconsRegular.shieldCheck,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'General',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.kGreyColor,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  ItemProfile(
                    title: 'Language',
                    icon: PhosphorIconsRegular.translate,
                    onTap: () {
                      selectLanguage();
                    },
                  ),
                  ItemProfile(
                    title: 'Password',
                    icon: PhosphorIconsRegular.password,
                    onTap: () {},
                  ),
                  ItemProfile(
                    title: 'Privacy Policy',
                    icon: PhosphorIconsRegular.lockKey,
                    onTap: () {},
                  ),
                  ItemProfile(
                    title: 'About Us',
                    icon: PhosphorIconsRegular.info,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            ButtonLogOut(
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  void selectLanguage() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Language',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              ...List.generate(
                listLanguage.length,
                (index) => ItemLanguage(
                  name: listLanguage[index].name,
                  logo: listLanguage[index].logo,
                  onPressed: () {
                    setState(() {
                      if (listLanguage[index].isSelect == true) {
                        for (var element in listLanguage) {
                          element.isSelect = false;
                        }
                      } else {
                        for (var element in listLanguage) {
                          element.isSelect = false;
                        }
                        listLanguage[index].isSelect = true;
                      }
                      // for (var element in listCardAdd) {
                      //   element.isSelect = false;
                      // }
                      // listLanguage[index].isSelect = true;
                    });
                    Navigator.pop(context);
                  },
                  isSelect: listLanguage[index].isSelect,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
