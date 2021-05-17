import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';
import 'package:wicka/view/pages/LoginScreen.dart';
import 'package:wicka/view/widgets/ClipperMainMenu.dart';
import 'package:wicka/view/widgets/CornerRadiusImage.dart';
import 'package:wicka/view/widgets/ItemMenuWidget.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colores.primaryBackground,
        body: Stack(
          children: [
            Positioned(child:
            ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colores.alternativeBackground,
                child: Image.asset(
                  "assets/bg_signin.jpg",
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.8,
                  fit: BoxFit.cover,
                ),
              ),
              clipper: ClipperMainMenu(),
            ),
            right: 0,
            top: MediaQuery.of(context).size.height * 0.05),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: Dimens.spaceBetweenFields),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  FutureBuilder<User>(
                    initialData: User(name: "", email: "", photo: ""),
                    future: SessionUserSP().getLoggedUser(),
                    builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                      return Container(
                          padding:
                          EdgeInsets.only(top: Dimens.spaceBetweenFields * 2,
                              bottom: Dimens.spaceBetweenFields),
                          width: MediaQuery.of(context).size.width * 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (snapshot.data.photo.isEmpty)
                                Image.asset("assets/logo_wicka.png", height: 80)
                              else
                                CornerRadiusImage(
                                    url: snapshot.data.photo,
                                    radiusCorner: 40.0,
                                    size: 80.0),
                              Text(snapshot.data.name,
                                  style: TextStyles.headerStyle),
                              Text(snapshot.data.email,
                                  style: TextStyles.subHeaderStyle)
                            ],
                          ));
                    },
                  ),
                  Expanded(
                    flex: 10,
                    // height: MediaQuery.of(context).size.height - 170,
                    child: Column(
                      children: [
                        ItemMenuWidget(
                            icon: Icons.favorite_border_outlined,
                            label: Strings.favorite,
                            onTap: () {
                            },
                            badgeText: "2"),
                        ItemMenuWidget(
                            icon: Icons.notifications_none,
                            label: Strings.notifications,
                            onTap: () {
                            },
                            badgeText: "5"),
                        ItemMenuWidget(
                            icon: Icons.call_outlined,
                            label: Strings.contactUs,
                            onTap: () {
                            },
                            badgeText: "")
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      // color: Colores.alternativeBackground,
                      // height: 40,
                      // padding: Dimens.padding10_5,
                      child: Column(
                        children: [
                        Divider(height: 2, color: Colores.border),
                        ItemMenuWidget(
                            icon: Icons.logout,
                            label: Strings.logOut,
                            onTap: () {
                              showLogoutDialog(context);
                            },
                            badgeText: "")
                      ],))
                ]))
          ],
        )
        );
  }

  showLogoutDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text(Strings.cancel, style: TextStyles.normalStyle),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = FlatButton(
      child: Text(Strings.accept, style: TextStyles.negativeTextStyle),
      onPressed: () {
        SessionUserSP().logout();
        Get.offAll(LoginScreen());
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(Strings.logOut, style: TextStyles.titleStyle),
      content: Text(Strings.logoutConfirm, style: TextStyles.normalStyle),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
