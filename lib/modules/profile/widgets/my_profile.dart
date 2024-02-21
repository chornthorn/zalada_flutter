import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
  });

  final String imageUrl;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 46,
            backgroundImage: NetworkImage(
              imageUrl,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          name,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          email,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.kGreyColor,
              ),
        ),
      ],
    );
  }
}
