import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.child,
    this.onRight,
    this.onLeft,
    this.icon = PhosphorIconsRegular.heart,
  });

  final String title;
  final VoidCallback? onRight;
  final VoidCallback? onLeft;
  final IconData? icon;
  final Widget? child;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onLeft ?? () => Navigator.of(context).pop(),
            borderRadius: BorderRadius.circular(100),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
              ),
              padding: EdgeInsets.all(AppSpacing.sm),
              child: Icon(
                PhosphorIcons.arrowLeft(),
                color: Colors.black.withOpacity(0.9),
                size: 20,
              ),
            ),
          ),
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(width: AppSpacing.sm),
          Spacer(),
          child ?? Container(),
          SizedBox(width: AppSpacing.sm),
          if (onRight != null)
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: onRight,
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
                  icon,
                  color: Colors.black.withOpacity(0.9),
                  size: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
