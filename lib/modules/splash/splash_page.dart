import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/modules/onboarding/presenter/onboarding_page.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routePath = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      context.go(OnBoardingPage.routePath);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/splash_logo.png'),
            width: 80,
            height: 80,
          ),
          const SizedBox(height: AppSpacing.md),
          Center(
            child: Text(
              'Zalada',
              style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: AppSpacing.xlg,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
