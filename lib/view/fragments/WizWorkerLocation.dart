import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kmello/controller/FinancialInformationController.dart';
import 'package:kmello/resources/styles/decorations.dart';
import 'package:kmello/resources/styles/text-styles.dart';
import 'package:kmello/resources/values/colors.dart';
import 'package:kmello/resources/values/dimens.dart';
import 'package:kmello/resources/values/strings.dart';
import 'package:kmello/view/widgets/BasicActions.dart';
import 'package:kmello/view/widgets/CornerRadiusImage.dart';
import 'package:kmello/view/widgets/DropDownBottomList.dart';

class WizWorkerLocation extends StatefulWidget {
  double height = 0.0;
  VoidCallback postContinue;

  WizWorkerLocation({this.height, this.postContinue});

  @override
  WizWorkerLocationState createState() => WizWorkerLocationState(
      height: this.height, postContinue: this.postContinue);
}

class WizWorkerLocationState extends State<WizWorkerLocation> {
  double height = 0.0;
  VoidCallback postContinue;

  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;
  Position _currentPosition;
  final Geolocator _geolocator = Geolocator();
  Set<Marker> markers = {};

  final FinancialInformationController _financialController =
      Get.put(FinancialInformationController());

  WizWorkerLocationState({this.height, this.postContinue});

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Opacity(
                opacity: 0.75,
                child: Image.asset(
                  "assets/step_4.png",
                  height: 150.0,
                  width: 150.0,
                )),
            right: 10.0,
            bottom: 10.0),
        Container(
            height: this.height,
            child: SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(Strings.locationStep,
                            style: TextStyles.sectionTitleStyle),
                        SizedBox(height: 30),
                        DropDownBottomList(
                          label: Strings.city,
                          options: [],
                        ),
                        TextFormField(
                          keyboardType: TextInputType.streetAddress,
                          controller:
                              this._financialController.accountNumberCtrl,
                          style: TextStyles.textFieldStyle,
                          cursorColor: Colores.primary,
                          decoration: Decorations.basicInputDecoration(
                              label: Strings.addressReference),
                        ),
                        SizedBox(height: Dimens.spaceBetweenFields),
                        Container(
                            height: 200.0,
                            child: GoogleMap(
                              onTap: (latLng) {},
                              markers: markers != null
                                  ? Set<Marker>.from(markers)
                                  : null,
                              initialCameraPosition: _initialLocation,
                              myLocationEnabled: true,
                              myLocationButtonEnabled: true,
                              mapType: MapType.normal,
                              zoomGesturesEnabled: true,
                              zoomControlsEnabled: true,
                              onMapCreated: (GoogleMapController controller) {
                                mapController = controller;
                              },
                            )),
                        BasicActionsButton(onStepContinue: () {
                          this.postContinue();
                        })
                      ]),
                )))
      ],
    );
  }

  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        if (this._currentPosition == null) {
          _currentPosition = position;
          print("_get current location");
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 11.0,
              ),
            ),
          );
          //this._getNearbyGirls();
        }
      });
    }).catchError((e) {
      print(e);
    });
  }
}
