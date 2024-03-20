import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zalada_flutter/modules/authentication/widgets/label_text.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';
import 'package:zalada_flutter/shared/spacing/app_spacing.dart';
import 'package:zalada_flutter/shared/widgets/custom_app_bar.dart';
import 'package:zalada_flutter/shared/widgets/custom_elevated.dart';
import 'package:zalada_flutter/shared/widgets/custom_text_form_field.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({super.key});

  static const routePath = '/edit_address';

  //

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  late TextEditingController nameLocationController;
  late TextEditingController addressController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    nameLocationController = TextEditingController();
    addressController = TextEditingController(
      text: getAddress(lat, long).toString(),
    );
    phoneNumberController = TextEditingController();
    getAddress(lat, long).then((value) {
      setState(() {
        address = value;
      });
    });
    print('-------------------$address');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameLocationController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
  }

  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(11.5564, 104.9282),
    zoom: 11.4746,
  );
  final LatLng position = LatLng(11.5564, 104.9282);
  double lat = 11.5564;
  double long = 104.9282;

  Future<String?> getAddress(double lat, double long) async {
    final placeMark = await placemarkFromCoordinates(lat, long);
    final address = placeMark[0];
    final street = '${address.thoroughfare}';
    final subLocality = '${address.subLocality}';
    final locality = '${address.locality}';
    final country = '${address.country}';
    return '$street, $subLocality, $locality, $country';
  }

  String? address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Select Address'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.md),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onCameraIdle: () {
                    getAddress(lat, long);
                  },
                  onCameraMove: (position) {
                    lat = position.target.latitude;
                    long = position.target.longitude;
                  },
                  onMapCreated: (GoogleMapController controller) {
                    if (!_controller.isCompleted) {
                      _controller.complete(controller);
                    }
                  },
                ),
                Icon(
                  Icons.location_on,
                  size: 40,
                  color: AppColors.kRedColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.md,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: AppSpacing.lg),
                    LabelText(label: 'Name Location'),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextFieldForms(
                      hintText: 'Name Location',
                    ),
                    SizedBox(height: AppSpacing.lg),
                    LabelText(label: 'Address'),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextFieldForms(
                      hintText: 'Address',
                      controller: addressController,
                    ),
                    SizedBox(height: AppSpacing.lg),
                    LabelText(label: 'Phone Number'),
                    SizedBox(height: AppSpacing.sm),
                    CustomTextFieldForms(
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: AppSpacing.lg),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          bottom: AppSpacing.xlg,
        ),
        child: CustomElevated(
          onPressed: () {},
          text: 'Save',
        ),
      ),
    );
  }
}
