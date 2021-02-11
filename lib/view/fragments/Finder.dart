import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/model/Category.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/view/widgets/HorizontalSlider.dart';
import 'package:wicka/view/widgets/NormalCard.dart';

class Finder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colores.primaryBackground,
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  this.searchBox,
                  HorizontalSlider(title: "Sugerencias del día"),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Más para ti...",
                          style: TextStyles.sliderTitleStyle)),
                  NormalCard(Category(
                      id: "",
                      name: "Producto 1",
                      details: "description...",
                      url:
                          "https://pliki.dlahandlu.pl/i/02/12/24/021224_r0_940.jpg")),
                  NormalCard(Category(
                      id: "",
                      name: "Producto 1",
                      details: "description...",
                      url:
                          "https://pliki.dlahandlu.pl/i/02/12/24/021224_r0_940.jpg")),
                  NormalCard(Category(
                      id: "",
                      name: "Producto 1",
                      details: "description...",
                      url:
                          "https://pliki.dlahandlu.pl/i/02/12/24/021224_r0_940.jpg"))
                ],
              )),
        ));
  }

  Widget searchBox = Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colores.alternativeBackground),
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      children: [
        Padding(
            padding: EdgeInsets.all(7.0),
            child: Icon(Icons.search, color: Colores.inactive, size: 25.0)),
        Expanded(
            child: TextField(
                style: TextStyles.textFieldStyle,
                cursorColor: Colores.primary,
                decoration: Decorations.basicInputDecorationNoBorder(
                    label: "Qué deseas comer hoy?")))
      ],
    ),
  );
}
