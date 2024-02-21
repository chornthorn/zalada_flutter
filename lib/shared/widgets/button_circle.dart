import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class ButtonCircle extends StatelessWidget {
  const ButtonCircle({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pop(context);
        }
      },
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
    );
  }
}
