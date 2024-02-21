import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/authentication/login/pages/login_page.dart';
import 'package:zalada_flutter/modules/authentication/widgets/label_text.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/close_keyboard.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_bottom_sheet.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';
import 'package:zalada_flutter/shared/widgets/custom_text_form_field.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  static const routePath = '/new_password_page';

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  bool newPassword = true;
  bool confirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CloseKeyboard.close(context),
      child: Scaffold(
        appBar: CustomAppBar(title: 'New Password'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/secure_payment.png',
                    height: 140,
                  ),
                ),
                Text(
                  'Please enter your new password.',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: AppSpacing.lg),
                LabelText(label: 'New Password'),
                const SizedBox(height: AppSpacing.sm),
                CustomTextFieldForms(
                  controller: passwordController,
                  hintText: 'New Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: newPassword,
                  onPressed: () {
                    setState(() {
                      newPassword = !newPassword;
                    });
                  },
                  suffixIcon: newPassword
                      ? PhosphorIconsRegular.eye
                      : PhosphorIconsRegular.eyeSlash,
                ),
                const SizedBox(height: AppSpacing.lg),
                LabelText(label: 'Confirm Password'),
                const SizedBox(height: AppSpacing.sm),
                CustomTextFieldForms(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: confirmPassword,
                  onPressed: () {
                    setState(() {
                      confirmPassword = !confirmPassword;
                    });
                  },
                  suffixIcon: confirmPassword
                      ? PhosphorIconsRegular.eye
                      : PhosphorIconsRegular.eyeSlash,
                ),
                const SizedBox(height: AppSpacing.xlg),
                CustomElevated(
                  onPressed: () {
                    CustomBottomSheet.showBottomSheetSuccess(
                      context: context,
                      onPressed: () {
                        context.go(LoginPage.routePath);
                      },
                    );
                  },
                  text: 'Continue',
                ),
                SizedBox(height: AppSpacing.xlg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
