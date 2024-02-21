import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/authentication/widgets/label_text.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';
import 'package:zalada_flutter/shared/widgets/custom_text_form_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  static const routePath = '/change-password-page';

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late final TextEditingController _oldPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool obscureTextOld = true;
  bool obscureTextNew = true;
  bool obscureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Change Password'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(label: 'Old Password'),
              SizedBox(height: AppSpacing.sm),
              CustomTextFieldForms(
                hintText: 'Old Password',
                obscureText: obscureTextOld,
                controller: _oldPasswordController,
                onPressed: () {
                  setState(() {
                    obscureTextOld = !obscureTextOld;
                  });
                },
                suffixIcon: obscureTextOld
                    ? PhosphorIconsRegular.eye
                    : PhosphorIconsRegular.eyeSlash,
              ),
              SizedBox(height: AppSpacing.md),
              LabelText(label: 'New Password'),
              SizedBox(height: AppSpacing.sm),
              CustomTextFieldForms(
                hintText: 'New Password',
                obscureText: obscureTextNew,
                controller: _newPasswordController,
                onPressed: () {
                  setState(() {
                    obscureTextNew = !obscureTextNew;
                  });
                },
                suffixIcon: obscureTextNew
                    ? PhosphorIconsRegular.eye
                    : PhosphorIconsRegular.eyeSlash,
              ),
              SizedBox(height: AppSpacing.md),
              LabelText(label: 'Confirm Password'),
              SizedBox(height: AppSpacing.sm),
              CustomTextFieldForms(
                hintText: 'Confirm Password',
                obscureText: obscureTextConfirm,
                controller: _confirmPasswordController,
                onPressed: () {
                  setState(() {
                    obscureTextConfirm = !obscureTextConfirm;
                  });
                },
                suffixIcon: obscureTextConfirm
                    ? PhosphorIconsRegular.eye
                    : PhosphorIconsRegular.eyeSlash,
              ),
              SizedBox(height: AppSpacing.xxxlg),
              CustomElevated(
                onPressed: () {},
                text: 'Save Changes',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
