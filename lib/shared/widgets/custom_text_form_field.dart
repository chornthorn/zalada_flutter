import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';

class CustomTextFieldForms extends StatefulWidget {
  const CustomTextFieldForms({
    required this.hintText,
    super.key,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.enable = true,
    this.prefixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.onPressed,
    this.prefixText,
    this.maxLines = 1,
    this.minLines = 1,
    this.onTap,
  });

  final String hintText;
  final IconData? suffixIcon;
  final bool? obscureText;
  final bool enable;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String? Function(String?)? onChange;
  final VoidCallback? onPressed;
  final String? prefixText;
  final int? maxLines;
  final int? minLines;
  final VoidCallback? onTap;

  @override
  State<CustomTextFieldForms> createState() => _CustomTextFieldFormsState();
}

class _CustomTextFieldFormsState extends State<CustomTextFieldForms> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      onChanged: widget.onChange,
      obscureText: widget.obscureText!,
      enabled: widget.enable,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.kBlackColor,
          ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        prefixText: widget.prefixText,
        isDense: true,
        prefixStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.kGreyColor,
        ),
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.kGreyColor,
            ),
        suffixIcon: IconButton(
          splashRadius: AppSpacing.xlg,
          onPressed: widget.onPressed,
          icon: Icon(
            widget.suffixIcon,
            size: AppSpacing.xlg - 2,
          ),
        ),
        prefixIcon: widget.prefixIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppSpacing.lg,
          horizontal: AppSpacing.lg,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          borderSide: const BorderSide(color: AppColors.kColorGray500),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          borderSide: const BorderSide(color: AppColors.kColorGray400),
        ),
        filled: true,
        fillColor: AppColors.kWhiteColor,
      ),
    );
  }
}
