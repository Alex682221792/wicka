import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmello/controller/FinancialInformationController.dart';
import 'package:kmello/resources/styles/decorations.dart';
import 'package:kmello/resources/styles/text-styles.dart';
import 'package:kmello/resources/values/colors.dart';
import 'package:kmello/resources/values/dimens.dart';
import 'package:kmello/resources/values/strings.dart';
import 'package:kmello/view/widgets/BasicActions.dart';
import 'package:kmello/view/widgets/CornerRadiusImage.dart';

class WizWorkerIntroduction extends StatelessWidget {
  double height = 0.0;
  VoidCallback postContinue;

  final FinancialInformationController _financialController =
      Get.put(FinancialInformationController());

  WizWorkerIntroduction({this.height, this.postContinue});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Opacity(
                opacity: 0.75,
                child: Image.asset(
                  "assets/step_3.png",
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
                        Text(Strings.introductionStep,
                            style: TextStyles.sectionTitleStyle),
                        SizedBox(height: 30),
                        GestureDetector(
                            onTap: () {},
                            child: CornerRadiusImage(
                                size: 90.0,
                                radiusCorner: 45.0,
                                url:
                                    "https://mk0ziglar4ifu5ixq7cx.kinstacdn.com/wp-content/uploads/2016/09/michelle-prince-profile-img.png")),
                        Text(Strings.helperProfilePhoto,
                            textAlign: TextAlign.center,
                            style: TextStyles.helperPictureStyle),
                        SizedBox(height: Dimens.spaceBetweenFields),
                        TextFormField(
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          minLines: 3,
                          controller:
                              this._financialController.accountNumberCtrl,
                          style: TextStyles.textFieldStyle,
                          cursorColor: Colores.primary,
                          decoration: Decorations.basicInputDecoration(
                              label: Strings.presentation),
                        ),
                        BasicActionsButton(onStepContinue: () {
                          this.postContinue();
                        })
                      ]),
                )))
      ],
    );
  }
}
