import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wicka/controller/AddressController.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/gradients.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/view/widgets/BasicBackButton.dart';
import 'package:wicka/view/widgets/LargeTextButton.dart';

class AddressScreen extends StatefulWidget {
  double height = 0.0;
  VoidCallback postContinue;

  AddressScreen({this.height});

  @override
  AddressScreenState createState() => AddressScreenState(height: this.height);
}

class AddressScreenState extends State<AddressScreen> {
  AddressController _addressController = Get.find();
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;
  Position _currentPosition;
  final Geolocator _geolocator = Geolocator();
  Set<Marker> markers = {};
  double height = 0.0;

  AddressScreenState({this.height});

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colores.primaryBackground,
      body: SingleChildScrollView(
        child: Container(
          height: this.height,
          child: Stack(
            children: [
              Column(
                children: [formLayer(), mapLayer()],
              ),
              BasicBackButton(onPress: () {
                Get.back();
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget mapLayer() {
    return Expanded(
        flex: 1,
        child: Stack(
          children: [
            //SizedBox(height: MediaQuery.of(context).size.height * 0.54),
            Container(
              height: double.infinity,
              color: Colores.alternativeBackground,
              child: GoogleMap(
                onTap: (latLng) {
                  addMarker(latLng);
                },
                markers: markers != null ? Set<Marker>.from(markers) : null,
                initialCameraPosition: _initialLocation,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
              ),
            ),
            Container(
                height: this.height * 0.05,
                decoration:
                    BoxDecoration(gradient: Gradients.whiteVerticalGradient)),
            Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: LargeTextButton(
                      colorButton: Colores.primary,
                      text: Strings.accept,
                      onPress: () {
                        this._addressController.saveAddress(() {Get.back();});
                      },
                    ),
                  ),
                ),
                bottom: Dimens.spaceBetweenFields)
          ],
        ));
  }

  Widget formLayer() {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.55,
      padding: Dimens.padding10_5,
      child: Column(
        children: [
          SizedBox(height: Dimens.spaceBetweenFields * 1.5),
          Text(Strings.addressTitle, style: TextStyles.titleStyle),
          SizedBox(height: Dimens.spaceBetweenFields),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: this._addressController.alias,
            style: TextStyles.textFieldStyle,
            cursorColor: Colores.primary,
            decoration: Decorations.basicInputDecorationWithHelper(
                label: Strings.aliasHint, helperText: Strings.aliasAddressHelp),
          ),
          SizedBox(height: Dimens.spaceBetweenFields),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: this._addressController.reference,
            style: TextStyles.textFieldStyle,
            cursorColor: Colores.primary,
            decoration: Decorations.basicInputDecorationWithHelper(
                label: Strings.referenceHint,
                helperText: Strings.referenceHelp),
          ),
          SizedBox(height: Dimens.spaceBetweenFields),
          TextFormField(
            enabled: false,
            keyboardType: TextInputType.text,
            controller: this._addressController.direction,
            style: TextStyles.textFieldStyle,
            cursorColor: Colores.primary,
            decoration:
                Decorations.basicInputDecoration(label: Strings.addressHint),
          )
        ],
      ),
    );
  }

  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        if (this._currentPosition == null) {
          _currentPosition = position;
          addMarker(LatLng(position.latitude, position.longitude));
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 11.0,
              ),
            ),
          );
        }
      });
    }).catchError((e) {
      print(e);
    });
  }

  addMarker(LatLng loc) {
    Marker marker = Marker(
        markerId: MarkerId('current_loc'),
        position: LatLng(
          loc.latitude,
          loc.longitude,
        ));
    _addressController.location.longitude = loc.longitude;
    _addressController.location.latitude = loc.latitude;
    setState(() {
      this.markers = {marker};
    });
  }
}
