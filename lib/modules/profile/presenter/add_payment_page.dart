import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zalada_flutter/modules/authentication/widgets/label_text.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';
import 'package:zalada_flutter/shared/widgets/custom_text_form_field.dart';

class AddPaymentPage extends StatefulWidget {
  const AddPaymentPage({super.key});

  static const routePath = '/add-payment-page';

  @override
  State<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
  late TextEditingController _cardNumberController;
  late TextEditingController _cardNameController;
  late TextEditingController _expiryDateController;
  late TextEditingController _cvvController;

  @override
  void initState() {
    _cardNumberController = TextEditingController();
    _cardNameController = TextEditingController();
    _expiryDateController = TextEditingController();
    _cvvController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardNameController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Add Payment'),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 150),
                padding: EdgeInsets.only(
                  top: 100,
                  left: AppSpacing.xlg,
                  right: AppSpacing.xlg,
                  bottom: AppSpacing.xlg,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSpacing.xlg),
                    topRight: Radius.circular(AppSpacing.xlg),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kColorGray200,
                      offset: Offset(0, -6),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(label: 'Card Name'),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextFieldForms(
                      controller: _cardNameController,
                      hintText: 'Card Name',
                    ),
                    SizedBox(height: AppSpacing.md),
                    LabelText(label: 'Card Number'),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextFieldForms(
                      controller: _cardNumberController,
                      hintText: 'Card Number',
                    ),
                    SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelText(label: 'Expiry Date'),
                              SizedBox(height: AppSpacing.sm),
                              GestureDetector(
                                onTap: () => selectDate(),
                                child: CustomTextFieldForms(
                                  onPressed: () => selectDate(),
                                  controller: _expiryDateController,
                                  hintText: 'Expiry Date',
                                  suffixIcon: Icons.calendar_month,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelText(label: 'CVV'),
                              SizedBox(height: AppSpacing.sm),
                              CustomTextFieldForms(
                                controller: _cvvController,
                                hintText: 'CVV',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.all(AppSpacing.md),
                margin: EdgeInsets.only(
                  left: AppSpacing.xlg,
                  right: AppSpacing.xlg,
                  top: AppSpacing.xlg,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kColorGray300,
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                  image: DecorationImage(
                    image: AssetImage('assets/images/so_card.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            left: AppSpacing.xlg,
            right: AppSpacing.xlg,
            bottom: AppSpacing.xlg,
          ),
          child: CustomElevated(
            text: 'Add Payment',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 3,
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
                  fontWeight: FontWeight.w500,
                  color: AppColors.kPrimaryColor,
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
                maximumDate: DateTime(2100),
                onDateTimeChanged: (DateTime newDateTime) {
                  setState(() {
                    _expiryDateController.text =
                        '${newDateTime.year}-${newDateTime.month}-${newDateTime.day}';
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
