import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
        horizontal: AppSpacing.lg,
      ),
      // decoration: BoxDecoration(
      //   color: AppColors.kWhiteColor,
      //   borderRadius: BorderRadius.circular(AppSpacing.md),
      //   boxShadow: [
      //     BoxShadow(
      //       color: AppColors.kColorGray200,
      //       spreadRadius: 1,
      //       blurRadius: 6,
      //       offset: const Offset(0, 3),
      //     ),
      //   ],
      // ),
      child: Image(
        image: NetworkImage(
          image,
        ),
      ),
    );
  }
}
