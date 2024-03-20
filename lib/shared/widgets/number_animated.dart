import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';

class NumberAnimated extends StatelessWidget {
  const NumberAnimated({
    super.key,
    required this.quantity,
    this.color = AppColors.kPrimaryColor,
  });

  final int quantity;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: Text(
        '$quantity',
        key: ValueKey<int>(quantity),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
      ),
    );
  }
}
