import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_flutter/modules/authentication/otp/page/otp_page.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/close_keyboard.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';
import 'package:zalada_flutter/shared/widgets/custom_text_form_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  static const routePath = '/forget_password_page';

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController(text: 'thoenchorn@gmail.com');

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CloseKeyboard.close(context),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Forget Password'),
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
                    height: 180,
                  ),
                ),
                Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Enter your email address to reset your password.',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: AppSpacing.lg),
                CustomTextFieldForms(
                  controller: emailController,
                  hintText: 'Email address',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: AppSpacing.xlg),
                CustomElevated(
                  onPressed: () {
                    context.push(
                      OTPPage.routePath,
                      extra: emailController.text,
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
