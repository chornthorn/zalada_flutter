import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/authentication/widgets/custom_button_social_media.dart';
import 'package:zalada_flutter/modules/authentication/widgets/do_not_account.dart';
import 'package:zalada_flutter/modules/authentication/widgets/label_text.dart';
import 'package:zalada_flutter/modules/authentication/widgets/or_continue_with.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/close_keyboard.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';
import 'package:zalada_flutter/shared/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const String routePath = '/register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  bool obscureText = true;
  bool obscureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CloseKeyboard.close(context),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xlg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create your new\naccount.',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: AppSpacing.xlg),
                  LabelText(label: 'Email Address'),
                  SizedBox(height: AppSpacing.xs),
                  CustomTextFieldForms(
                    controller: emailController,
                    hintText: 'Email address',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: AppSpacing.lg),
                  LabelText(label: 'Password'),
                  SizedBox(height: AppSpacing.xs),
                  CustomTextFieldForms(
                    controller: passwordController,
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    suffixIcon: obscureText
                        ? PhosphorIconsRegular.eye
                        : PhosphorIconsRegular.eyeSlash,
                    hintText: 'Password',
                    obscureText: obscureText,
                  ),
                  SizedBox(height: AppSpacing.lg),
                  LabelText(label: 'Confirm Password'),
                  SizedBox(height: AppSpacing.xs),
                  CustomTextFieldForms(
                    controller: confirmPasswordController,
                    onPressed: () {
                      setState(() {
                        obscureTextConfirm = !obscureTextConfirm;
                      });
                    },
                    suffixIcon: obscureTextConfirm
                        ? PhosphorIconsRegular.eye
                        : PhosphorIconsRegular.eyeSlash,
                    hintText: 'Confirm Password',
                    obscureText: obscureTextConfirm,
                  ),
                  SizedBox(height: AppSpacing.xxlg),
                  CustomElevated(
                    onPressed: () {},
                    text: 'Register',
                  ),
                  SizedBox(height: AppSpacing.xlg),
                  OrContinueWith(),
                  SizedBox(height: AppSpacing.xlg),
                  CustomButtonSocialMedia(
                    onTap: () {},
                    text: 'Continue with Apple',
                    icon: 'assets/svg/apple.svg',
                  ),
                  SizedBox(height: AppSpacing.md),
                  CustomButtonSocialMedia(
                    onTap: () {},
                    text: 'Continue with Google',
                    icon: 'assets/svg/google.svg',
                  ),
                  SizedBox(height: AppSpacing.md),
                  CustomButtonSocialMedia(
                    onTap: () {},
                    text: 'Continue with Facebook',
                    icon: 'assets/svg/facebook.svg',
                  ),
                  SizedBox(height: AppSpacing.md),
                  DoNotAccount(
                    onPressed: () {
                      context.pop();
                    },
                    text: 'Already have an account?',
                    textButton: 'Login',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
