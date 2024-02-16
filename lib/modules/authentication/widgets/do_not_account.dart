import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';

class DoNotAccount extends StatelessWidget {
  const DoNotAccount({
    super.key,
    this.onPressed,
    required this.text,
    required this.textButton,
  });

  final VoidCallback? onPressed;
  final String text;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.kGreyColor,
              ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.kPrimaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
