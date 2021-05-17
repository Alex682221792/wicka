import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/FinderController.dart';
import 'package:wicka/model/Catalog.dart';
import 'package:wicka/model/Product.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/utils/GeneralUtils.dart';
import 'package:wicka/view/widgets/BasicBackButton.dart';
import 'package:wicka/view/widgets/ProductItem.dart';

class CategoryViewer extends StatelessWidget {
  Catalog category;
  FinderController _controller = Get.find();

  CategoryViewer(this.category);

  @override
  Widget build(BuildContext context) {
    var backgroundHeader = GeneralUtils().getRandomColorWithAlpha(alpha: 0.85);
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: BasicBackButton(onPress: (){Get.back();}),
            backgroundColor: backgroundHeader,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                    centerTitle: true,
                    title: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: 1.0,
                        child: Container(child: Text(
                          category.name,
                          style: TextStyles.normalWhiteText,
                        ),
                        padding: Dimens.padding10_5,
                        decoration: Decorations.darkOpacity,)),
                    background: Hero(child: Image.network(
                      category.config.firstWhere((element) => element.label == "url").value,
                      fit: BoxFit.cover,
                    ),
                    tag: category.id));
              })),
        ];
      },
      body:
      FutureBuilder<List<Product>>(
        // Initialize FlutterFire
        future: _controller.getProductByType(category.id),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text(Strings.generalError);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.data.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ProductItem(snapshot.data[index]);
                },
              );
            } else {
              return Center(
                child: Text(Strings.emptyList, style: TextStyles.normalStyle)
              );
            }
            // return LoginScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
