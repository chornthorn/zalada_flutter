import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';

class CustomBottomSheet {
  static void showBottomSheetSuccess({
    required BuildContext context,
    required VoidCallback onPressed,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xlg,
            vertical: AppSpacing.xlg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('assets/images/success.png'),
                height: 180,
              ),
              Text(
                'Congratulations!',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Your account is ready to use. You will be redirected to the Homepage in a few seconds.',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: AppSpacing.lg),
              CustomElevated(
                onPressed: onPressed,
                text: 'Continue',
              ),
              SizedBox(height: AppSpacing.sm)
            ],
          ),
        );
      },
    );
  }
}
