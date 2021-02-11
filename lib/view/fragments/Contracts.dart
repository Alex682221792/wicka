import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wicka/enums/StatusPostEnum.dart';
import 'package:wicka/model/KmelloPost.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/view/widgets/KmelloPostItem.dart';

class Contracts extends StatelessWidget {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;
  Position _currentPosition;
  final Geolocator _geolocator = Geolocator();
  Set<Marker> markers = {};
  List<Widget> postWidgetsList = [
    KmelloPostItem(
        kmelloInfo: KmelloPost(
            id: "123456",
            budget: 20,
            description: "la descripcion",
            startDate: DateTime.now(),
            title: "Titulo 125434",
            status: StatusPostEnum.IN_PROGRESS)),
    KmelloPostItem(
        kmelloInfo: KmelloPost(
            id: "123456",
            budget: 20,
            description: "la descripcion",
            startDate: DateTime.now(),
            title: "Titulo 125434",
            status: StatusPostEnum.IN_PROGRESS)),
    KmelloPostItem(
        kmelloInfo: KmelloPost(
            id: "123456",
            budget: 20,
            description: "la descripcion",
            startDate: DateTime.now(),
            title: "Titulo 125434",
            status: StatusPostEnum.IN_PROGRESS)),
    KmelloPostItem(
        kmelloInfo: KmelloPost(
            id: "123456",
            budget: 20,
            description: "la descripcion",
            startDate: DateTime.now(),
            title: "Titulo 125434",
            status: StatusPostEnum.IN_PROGRESS)),
    KmelloPostItem(
        kmelloInfo: KmelloPost(
            id: "123456",
            budget: 20,
            description: "la descripcion",
            startDate: DateTime.now(),
            title: "Titulo 125434",
            status: StatusPostEnum.IN_PROGRESS)),
    KmelloPostItem(
        kmelloInfo: KmelloPost(
            id: "123456",
            budget: 20,
            description: "la descripcion",
            startDate: DateTime.now(),
            title: "Titulo 125434",
            status: StatusPostEnum.IN_PROGRESS)),
    KmelloPostItem(
        kmelloInfo: KmelloPost(
            id: "123456",
            budget: 20,
            description: "la descripcion",
            startDate: DateTime.now(),
            title: "Titulo 125434",
            status: StatusPostEnum.IN_PROGRESS)),
    KmelloPostItem(
        kmelloInfo: KmelloPost(
            id: "123456",
            budget: 20,
            description: "la descripcion",
            startDate: DateTime.now(),
            title: "Titulo 125434",
            status: StatusPostEnum.IN_PROGRESS)),
    KmelloPostItem(
        kmelloInfo: KmelloPost(
            id: "123456",
            budget: 20,
            description: "la descripcion",
            startDate: DateTime.now(),
            title: "Titulo 125434",
            status: StatusPostEnum.IN_PROGRESS)),
    KmelloPostItem(
        kmelloInfo: KmelloPost(
            id: "123456",
            budget: 20,
            description: "la descripcion",
            startDate: DateTime.now(),
            title: "Titulo 125434",
            status: StatusPostEnum.IN_PROGRESS)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colores.primaryBackground,
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(children: [
                Text(Strings.contractsDescription,
                    style: TextStyles.normalStyle)
              ]),
              Expanded(
                  child: ListView(
                key: Key(postWidgetsList.length.toString()),
                children: postWidgetsList,
              ))
            ],
          ),
        ));
  }
}
