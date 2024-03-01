import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:zalada_flutter/modules/authentication/widgets/label_text.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';
import 'package:zalada_flutter/shared/widgets/custom_text_form_field.dart';

class EditeProfilePage extends StatefulWidget {
  const EditeProfilePage({super.key});

  static const routePath = '/edite-profile';

  @override
  State<EditeProfilePage> createState() => _EditeProfilePageState();
}

class _EditeProfilePageState extends State<EditeProfilePage> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController genderController;
  late TextEditingController dateOfBirthController;

  @override
  void initState() {
    fullNameController = TextEditingController(text: 'Rosé');
    emailController = TextEditingController(text: 'thoenchorn@gmail.com');
    phoneNumberController = TextEditingController(text: '081234567890');
    dateOfBirthController = TextEditingController(text: '1997-02-11');
    genderController = TextEditingController(text: 'Female');

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    dateOfBirthController.dispose();
    genderController.dispose();
  }

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Edite Profile'),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Ros%C3%A9_at_a_fan_signing_event_on_September_25%2C_2022_%28cropped%29.jpg/1200px-Ros%C3%A9_at_a_fan_signing_event_on_September_25%2C_2022_%28cropped%29.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.xs),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppSpacing.xs),
                              color: AppColors.kPrimaryColor.withOpacity(0.8),
                            ),
                            child: Icon(
                              PhosphorIconsRegular.pencilSimpleLine,
                              color: AppColors.kWhiteColor,
                              size: AppSpacing.xlg,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  LabelText(label: 'Full Name'),
                  const SizedBox(height: AppSpacing.xs),
                  CustomTextFieldForms(
                    controller: fullNameController,
                    hintText: 'Enter your full name',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  LabelText(label: 'Email'),
                  const SizedBox(height: AppSpacing.xs),
                  CustomTextFieldForms(
                    hintText: 'Enter your email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  LabelText(label: 'Date of Birth'),
                  const SizedBox(height: AppSpacing.xs),
                  CustomTextFieldForms(
                    hintText: 'Select your date of birth',
                    controller: dateOfBirthController,
                    suffixIcon: PhosphorIconsRegular.calendar,
                    onPressed: selectDate,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  LabelText(label: 'Phone Number'),
                  const SizedBox(height: AppSpacing.xs),
                  CustomTextFieldForms(
                    hintText: 'Enter your phone number',
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  LabelText(label: 'Gender'),
                  const SizedBox(height: AppSpacing.xs),
                  GestureDetector(
                    onTap: () {
                      DropdownMenuItem<String>(
                        value: selectedGender,
                        child: Text(selectedGender!),
                      );
                    },
                    child: CustomTextFieldForms(
                      hintText: 'Select your gender',
                      enable: false,
                      controller: genderController,
                      suffixIcon: PhosphorIconsRegular.caretDown,
                      onPressed: () {
                        DropdownMenuItem<String>(
                          value: selectedGender,
                          child: Text(selectedGender!),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xlg),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.lg,
          ),
          child: CustomElevated(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Save Changes',
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 2.5,
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSpacing.sm),
            topRight: Radius.circular(AppSpacing.sm),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CupertinoButton(
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: AppSpacing.lg,
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                minimumDate: DateTime(1990),
                maximumDate: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  setState(() {
                    dateOfBirthController.text =
                        newDateTime.toString().split(' ')[0];
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
