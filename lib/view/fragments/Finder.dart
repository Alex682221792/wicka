import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/FinderController.dart';
import 'package:wicka/model/Catalog.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/utils/GeneralUtils.dart';
import 'package:wicka/view/pages/CategoryViewer.dart';
import 'package:wicka/view/widgets/DailySuggestion.dart';
import 'package:wicka/view/widgets/KeepAliveWrapper.dart';
import 'package:wicka/view/widgets/NormalCard.dart';

class Finder extends StatefulWidget {
  @override
  State createState() {
    return FinderState();
  }
}

class FinderState extends State<Finder> {
  final FinderController _controller = Get.put(FinderController());
  Future<List<Catalog>> categoryList;

  @override
  void initState() {
    categoryList = _controller.getProductTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colores.primaryBackground,
      body: Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              this.getSearchBox(),
              SizedBox(height: Dimens.spaceBetweenFields * 0.5),
              Obx(
                () => Expanded(
                    child: SingleChildScrollView(
                        child: AnimatedSwitcher(
                            duration: Duration(seconds: 1),
                            child: _controller.isSearchMode.value
                                ? getSearcherFrag()
                                : getHomeFrag()))),
              )
            ],
          )),
    );
  }

  Widget getSearchBox() {
    return Container(
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
                      label: "Qué deseas comer hoy?"),
                  onChanged: (value) {
                    this._controller.updateSearchMode(value.isNotEmpty);
                  }))
        ],
      ),
    );
  }

  Widget getSearcherFrag() {
    return Center(child: CircularProgressIndicator());
  }

  Widget getHomeFrag() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DailySuggestion(),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child:
                Text(Strings.moreForYou, style: TextStyles.sliderTitleStyle)),
        FutureBuilder<List<Catalog>>(
          future: categoryList,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return Text(Strings.generalError);
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  ...(snapshot.data
                      .map((category) =>
                          GestureDetector(child: NormalCard(category),
                            onTap: (){Get.to(CategoryViewer(category));},
                          )
                  )
                      .toList())
                ],
              );
              // return LoginScreen();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return Center(child: CircularProgressIndicator());
          },
        )
      ],
    );
  }
}
