import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class CircularWidget extends StatelessWidget {
  const CircularWidget({
    required this.currentIndex,
    required this.pageController,
    this.onPressed,
    super.key,
  });

  final int currentIndex;
  final PageController pageController;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onPressed,
          child: CircularPercentIndicator(
            radius: 40,
            lineWidth: 3,
            percent: currentIndex == 0
                ? 0.33
                : currentIndex == 1
                    ? 0.66
                    : 1,
            progressColor: AppColors.kPrimaryColor,
            backgroundColor: AppColors.kColorGray300,
            circularStrokeCap: CircularStrokeCap.round,
            center: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward_outlined,
                color: AppColors.kWhiteColor,
                size: 26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
