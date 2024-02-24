import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/modules/authentication/login/pages/login_page.dart';
import 'package:zalada_flutter/modules/onboarding/widgets/circular_widget.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/models/on_boarding_model.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  static const String routePath = '/onboarding';

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBackgroundColor,
        elevation: 0,
        toolbarHeight: 65,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: AppSpacing.xs,
            top: AppSpacing.sm,
          ),
          child: Row(
            children: [
              TextButton(
                onPressed: currentIndex == 0
                    ? null
                    : () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                child: Text(
                  currentIndex == 0 ? '' : 'Prev',
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: AppSpacing.xs,
              top: AppSpacing.xs,
            ),
            child: TextButton(
              onPressed: currentIndex == 2
                  ? null
                  : () {
                      context.push(LoginPage.routePath);
                    },
              child: Text(
                currentIndex == 2 ? '' : 'Skip',
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            itemCount: onBoardingModel.length,
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                child: Column(
                  children: [
                    Image.asset(
                      onBoardingModel[index].image,
                      height: height * 0.35,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.xlg),
                      child: Column(
                        children: [
                          Text(
                            onBoardingModel[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            onBoardingModel[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: height * 0.05,
            left: 0,
            right: 0,
            child: CircularWidget(
              currentIndex: currentIndex,
              pageController: pageController,
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
                if (currentIndex == 2) {
                  context.push(LoginPage.routePath);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
