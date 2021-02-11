import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/FinancialInformationController.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/view/widgets/BasicActions.dart';
import 'package:wicka/view/widgets/DropDownBottomList.dart';

class WizWorkerFinancial extends StatelessWidget {
  double height = 0.0;
  VoidCallback postContinue;

  final FinancialInformationController _financialController =
      Get.put(FinancialInformationController());

  WizWorkerFinancial({this.height, this.postContinue});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Opacity(
                opacity: 0.75,
                child: Image.asset(
                  "assets/step_5.png",
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
                        Text(Strings.financialStep,
                            style: TextStyles.sectionTitleStyle),
                        SizedBox(height: 30),
                        DropDownBottomList(
                          label: Strings.bank,
                          options: [],
                        ),
                        SizedBox(height: Dimens.spaceBetweenFields),
                        DropDownBottomList(
                          label: Strings.accountType,
                          options: [],
                        ),
                        SizedBox(height: Dimens.spaceBetweenFields),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller:
                              this._financialController.accountNumberCtrl,
                          style: TextStyles.textFieldStyle,
                          cursorColor: Colores.primary,
                          decoration: Decorations.basicInputDecoration(
                              label: Strings.accountNumber),
                        ),
                        SizedBox(height: Dimens.spaceBetweenFields),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: this._financialController.dniOwnerCtrl,
                          style: TextStyles.textFieldStyle,
                          cursorColor: Colores.primary,
                          decoration: Decorations.basicInputDecoration(
                              label: Strings.dniAccountOwner),
                        ),
                        SizedBox(height: Dimens.spaceBetweenFields),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: this._financialController.nameOwnerCtrl,
                          style: TextStyles.textFieldStyle,
                          cursorColor: Colores.primary,
                          decoration: Decorations.basicInputDecoration(
                              label: Strings.nameAccountOwner),
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
