import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zalada_flutter/modules/authentication/new_password/page/new_password.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/close_keyboard.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key, required this.email});

  final String email;

  static const routePath = '/otp_page';

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  late TextEditingController otpController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    otpController = TextEditingController();
    formKey = GlobalKey<FormState>();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late Timer timer;
  bool enableResend = false;
  int secondsRemaining = 120;

  void _resendCode() {
    setState(() {
      secondsRemaining = 120;
      enableResend = false;
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  String formatTime(int timeInSecs) {
    final minutes = (timeInSecs / 60).floor();
    final seconds = timeInSecs - (minutes * 60);
    final formattedSeconds = seconds < 10 ? '0$seconds' : '$seconds';
    return '0$minutes:$formattedSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CloseKeyboard.close(context),
      child: Scaffold(
        appBar: CustomAppBar(title: 'OTP Verification'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xlg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/otp.png',
                    height: 180,
                  ),
                ),
                Text(
                  'OTP Verification',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Please enter the OTP sent to your email '
                  '${widget.email.replaceRange(5, widget.email.indexOf('@'), '*******')}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Form(
                  key: formKey,
                  child: PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: TextInputType.number,
                    controller: otpController,
                    appContext: context,
                    length: 4,
                    obscureText: false,
                    useExternalAutoFillGroup: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(AppSpacing.md),
                      fieldHeight: 60,
                      fieldWidth: 60,
                      selectedColor: AppColors.kPrimaryColor,
                      inactiveColor: AppColors.kGreyColor,
                      activeColor: AppColors.kPrimaryColor,
                      errorBorderColor: AppColors.kRedColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Resend Code',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryColor,
                          ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    if (enableResend)
                      InkWell(
                        borderRadius: BorderRadius.circular(AppSpacing.lg),
                        onTap: _resendCode,
                        child: Text(
                          ' Resend ',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.kOrangeColor,
                                  ),
                        ),
                      ),
                    Text(
                      secondsRemaining == 0 ? '' : formatTime(secondsRemaining),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kGreyColor,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xlg),
                CustomElevated(
                  onPressed: () {
                    context.push(NewPasswordPage.routePath);
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
