import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/view/widgets/CornerRadiusImage.dart';
import 'package:wicka/view/widgets/LabelView.dart';
import 'package:wicka/view/widgets/PostulantItem.dart';

class KmelloViewer extends StatelessWidget {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;
  Position _currentPosition;
  final Geolocator _geolocator = Geolocator();
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: Colores.primaryBackground,
      padding: Dimens.padding10_5,
      child: Column(children: [
        Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 200.0,
            child: GoogleMap(
              onTap: (latLng) {},
              markers: markers != null ? Set<Marker>.from(markers) : null,
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
        Row(
          children: [
            CornerRadiusImage(
                size: 40.0,
                radiusCorner: 20.0,
                url:
                    "https://mk0ziglar4ifu5ixq7cx.kinstacdn.com/wp-content/uploads/2016/09/michelle-prince-profile-img.png"),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nombre de contratante",
                    style: TextStyles.sectionTitleStyle),
                Row(
                  children: [
                    Expanded(
                      child: RatingBarIndicator(
                          direction: Axis.horizontal,
                          rating: 3.8,
                          itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          itemCount: 5,
                          itemSize: 20.0),
                    ),
                    Text("# de contratos", style: TextStyles.tableHeadStyle)
                  ],
                ),
              ],
            ))
          ],
        ),
        LabelView(
          title: "Detalles",
          description:
              "Construir un cerramiento bla bla bla bla bla bla bla...............................",
        ),
        Row(
          children: [
            Expanded(
                child: LabelView(
              title: "Pago propuesto",
              description: "\$50",
            )),
            Expanded(
                child: LabelView(
              title: "Fecha",
              description: "02-ene-2021",
            ))
          ],
        ),
        Row(children: [
          LabelView(
            title: "Ubicación",
            description: "El bananero",
          )
        ]),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: LabelView(
                  title: "Total ofertantes",
                  description: "26",
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3.0),
              height: 60.0,
              color: Colores.border,
              width: 1.0,
            ),
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    TextField(
                        controller: TextEditingController(text: "0.0"),
                        keyboardType: TextInputType.number,
                        style: TextStyles.textFieldStyle,
                        cursorColor: Colores.primary,
                        decoration: Decorations.basicInputDecoration(
                            label: "Tu oferta")),
                    Positioned(
                        child: FlatButton(
                            onPressed: () {},
                            child: Text("Enviar",
                                style: TextStyles.tableHeadStyle)),
                        right: 1.0,
                        bottom: 1.0)
                  ],
                ))
          ],
        ),
        PostulantItem(),
        PostulantItem(),
        PostulantItem(),
        PostulantItem(),
        PostulantItem()
      ]),
    ));
  }
}
