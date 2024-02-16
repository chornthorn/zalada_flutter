import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/authentication/forget_password/page/forget_password_page.dart';
import 'package:zalada_flutter/modules/authentication/register/page/register_page.dart';
import 'package:zalada_flutter/modules/authentication/widgets/custom_button_social_media.dart';
import 'package:zalada_flutter/modules/authentication/widgets/do_not_account.dart';
import 'package:zalada_flutter/modules/authentication/widgets/label_text.dart';
import 'package:zalada_flutter/modules/authentication/widgets/or_continue_with.dart';
import 'package:zalada_flutter/modules/main/presenter/main_page.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/close_keyboard.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';
import 'package:zalada_flutter/shared/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routePath = '/login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool obscureText = true;

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
                    'Login to your\naccount.',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: AppSpacing.xlg),
                  LabelText(label: 'Email Address'),
                  SizedBox(height: AppSpacing.xs),
                  CustomTextFieldForms(
                    hintText: 'Email address',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: AppSpacing.lg),
                  LabelText(label: 'Password'),
                  SizedBox(height: AppSpacing.xs),
                  CustomTextFieldForms(
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
                  SizedBox(height: AppSpacing.sm),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.push(ForgetPasswordPage.routePath);
                      },
                      child: Text(
                        'Forgot Password?',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.kPrimaryColor,
                                ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.lg),
                  CustomElevated(
                    onPressed: () {
                      context.push(MainPage.routePath);
                    },
                    text: 'Login',
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
                      context.push(RegisterPage.routePath);
                    },
                    text: 'Don\'t have an account?',
                    textButton: 'Register',
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
