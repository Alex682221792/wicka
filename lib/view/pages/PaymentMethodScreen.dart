import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wicka/controller/PaymentMethodController.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/view/widgets/BasicBackButton.dart';
import 'package:wicka/view/widgets/LargeTextButton.dart';

class PaymentMethodScreen extends StatelessWidget {
  final PaymentMethodController _paymentMethodController = Get.put(PaymentMethodController());
  double percentHeightScreen = 1.0;

  PaymentMethodScreen({this.percentHeightScreen});


  FocusNode cvvFocusNode = FocusNode();

  void textFieldFocusDidChange() {
    _paymentMethodController.isCvvFocused.value = cvvFocusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    cvvFocusNode.addListener(textFieldFocusDidChange);
    return Scaffold(
      backgroundColor: Colores.primaryBackground,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * percentHeightScreen,
          child: Stack(
            children: [
              formLayer(context),
              BasicBackButton(onPress: () {
                Get.back();
              })
            ]
          ),
        ),
      ),
    );
  }


  Widget formLayer(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.55,
      padding: Dimens.padding10_5,
      child: Column(
        children: [
          SizedBox(height: Dimens.spaceBetweenFields * 1.5),
          Text(Strings.paymentMethodTitle, style: TextStyles.titleStyle),
          SizedBox(height: Dimens.spaceBetweenFields),
          GetBuilder<PaymentMethodController>(builder:
              (_) => CreditCardWidget(
                width: MediaQuery.of(context).size.width * 0.85,
                cardNumber: _paymentMethodController.cardNumber.value.text,
                expiryDate: _paymentMethodController.expiryDate.text,
                cardHolderName: _paymentMethodController.cardHolderName.text,
                cvvCode: _paymentMethodController.cvvCode.text,
                showBackView: _paymentMethodController.isCvvFocused.value,
              )
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [MaskTextInputFormatter(mask: "#### #### #### ####")],
            controller: this._paymentMethodController.cardNumber,
            style: TextStyles.textFieldStyle,
            cursorColor: Colores.primary,
            decoration: Decorations.basicInputDecorationWithHint(
                label: Strings.cardNumber, hint: Strings.cardNumberHint),
            onTap: (){toggleFocus(false);},
            onChanged: (_){_paymentMethodController.update();},
          ),
          SizedBox(height: Dimens.spaceBetweenFields),
          Row(
            mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 2,
                    child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [MaskTextInputFormatter(mask: "##/##")],
                  controller: this._paymentMethodController.expiryDate,
                  style: TextStyles.textFieldStyle,
                  cursorColor: Colores.primary,
                  decoration: Decorations.basicInputDecorationWithHint(
                      label: Strings.expiryDate, hint: Strings.expiryDateHint),
                  onTap: (){toggleFocus(false);},
                  onChanged: (_){_paymentMethodController.update();},
                  validator: (value) {
                    if (value.isEmpty) {
                      return null;
                    }
                    final components = value.split("/");
                    if (components.length == 2) {
                      final month = int.tryParse(components[0]);
                      final year = int.tryParse(components[1]);
                      if (month != null && year != null) {
                        final date = DateTime(year, month, 1);
                        if (date.year == year && date.month == month) {
                          return null;
                        }
                      }
                    }
                    return "wrong date";
                  },
                )),
                SizedBox(width: Dimens.spaceBetweenFields),
            Expanded(
              flex: 1,
                child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [MaskTextInputFormatter(mask: "###")],
              controller: this._paymentMethodController.cvvCode,
              style: TextStyles.textFieldStyle,
              cursorColor: Colores.primary,
              decoration: Decorations.basicInputDecorationWithHint(
                  label: Strings.cvv, hint: Strings.cvvHint),
              // focusNode: cvvFocusNode,
              onTap: (){toggleFocus(true);},
              onChanged: (_){_paymentMethodController.update();},
            ))

          ]),
          SizedBox(height: Dimens.spaceBetweenFields),
          TextFormField(
            keyboardType: TextInputType.name,
            maxLength: 80,
            controller: this._paymentMethodController.cardHolderName,
            style: TextStyles.textFieldStyle,
            cursorColor: Colores.primary,
            decoration: Decorations.basicInputDecoration(
                label: Strings.holderName),
            onTap: (){toggleFocus(false);},
            onChanged: (_){_paymentMethodController.update();},
          ),
          SizedBox(height: Dimens.spaceBetweenFields),
          Center(
            child: LargeTextButton(
              colorButton: Colores.primary,
              text: Strings.accept,
              onPress: () {
                // this._signUpController.sendRegister();
              },
            ),
          )
        ],
      ),
    );
  }

  void toggleFocus(bool status) {
    _paymentMethodController.isCvvFocused.value = status;
    _paymentMethodController.update();
  }
}