import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wicka/resources/styles/gradients.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/utils/GeneralUtils.dart';

class Decorations {
  static InputDecoration basicInputDecoration({label: String}) {
    return InputDecoration(
        labelText: label,
        labelStyle: TextStyles.hintBorderTextStyle,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.secondary, width: 0.0)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.secondary, width: 0.0)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.tertiary, width: 0.0)));
  }

  static InputDecoration basicInputDecorationWithHint(
      {label: String, hint: String}) {
    return InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyles.hintBorderTextStyle,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.secondary, width: 0.0)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.secondary, width: 0.0)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.tertiary, width: 0.0)));
  }

  static InputDecoration basicInputDecorationWithHelper(
      {label: String, helperText: String}) {
    return InputDecoration(
        helperText: helperText,
        labelText: label,
        labelStyle: TextStyles.hintBorderTextStyle,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.secondary, width: 0.0)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.secondary, width: 0.0)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.tertiary, width: 0.0)));
  }

  static InputDecoration basicInputDecorationNoBorder({label: String}) {
    return InputDecoration(
        labelText: label,
        labelStyle: TextStyles.signUpNowStyle,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.0)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.0)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.0)));
  }

  static InputDecoration dropdownInputDecoration({label: String}) {
    return InputDecoration(
        suffixIcon: Icon(Icons.arrow_drop_down),
        labelText: label,
        labelStyle: TextStyles.hintBorderTextStyle,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.secondary, width: 0.0)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.secondary, width: 0.0)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colores.tertiary, width: 0.0)));
  }

  static Decoration normalShadow = BoxDecoration(
      color: Colors.grey[600],
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.black26, offset: Offset(0.0, 0.0), blurRadius: 4.0)
      ]);

  static Decoration randomColor = BoxDecoration(
      color: GeneralUtils().getRandomColor(),
      borderRadius: BorderRadius.all(Radius.circular(Dimens.radiusGeneral)));

  static Decoration circleShadow({size: Double}) {
    return BoxDecoration(
        color: Colores.primaryBackground,
        borderRadius: BorderRadius.all(Radius.circular(size * 0.5)),
        boxShadow: [
          BoxShadow(
              color: Colores.alternativeBackground,
              offset: Offset(0.0, 0.0),
              blurRadius: 6.0)
        ]);
  }

  static Decoration circleShadowWithBackground({size: Double, background: Color}) {
    return BoxDecoration(
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(size * 0.5)),
        boxShadow: [
          BoxShadow(
              color: background,
              offset: Offset(0.0, 0.0),
              blurRadius: 6.0)
        ]);
  }

  static Decoration tabBarShadow = BoxDecoration(
    //gradient: Gradients.wavesGradient,
    color: Colores.primaryBackground,
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //borderRadius: BorderRadius.only(
    //    topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
    // boxShadow: [
    //   BoxShadow(
    //       color: Colors.black26, offset: Offset(0.0, 1.0), blurRadius: 4.0)
    // ]
  );

  static Decoration topBarShadow = BoxDecoration(
    color: Colores.primaryBackground,
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    // boxShadow: [
    //   BoxShadow(
    //       color: Colors.black26, offset: Offset(0.0, 0.0), blurRadius: 4.0)
    // ]
  );

  static Decoration summaryOrder = BoxDecoration(
      color: Colores.primary,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.black26, offset: Offset(0.0, 0.0), blurRadius: 4.0)
      ]);

  static Decoration counterBarShadow = BoxDecoration(
      color: Colores.primaryBackground,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.black26, offset: Offset(0.0, 0.0), blurRadius: 4.0)
      ]);

  static Decoration addToCarButtonShadow = BoxDecoration(
      color: Colors.green[300],
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.black26, offset: Offset(0.0, 0.0), blurRadius: 4.0)
      ]);

  static Decoration getCustomDecoration({color: Color, cornerRadius: Double}) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
            Radius.circular(cornerRadius == null ? 10.0 : cornerRadius)),
        boxShadow: [
//          BoxShadow(
//              color: Colors.black26, offset: Offset(0.0, 0.0), blurRadius: 2.0)
        ]);
  }

  static Decoration gradientButtonStyle = BoxDecoration(
      gradient: Gradients.wavesGradient,
      borderRadius: BorderRadius.circular(30.0));

  static Decoration outlineButtonStyle = BoxDecoration(
      color: Colores.primaryBackground,
      borderRadius: BorderRadius.circular(30.0),
      border: Border.all(color: Colores.secondary, width: 1.0));

  static Decoration secondaryButtonStyle = BoxDecoration(
      color: Colores.primaryBackground,
      borderRadius: BorderRadius.circular(30.0),
      border: Border.all(color: Colores.tertiary, width: 1.0));

  static Decoration dateOrderStyle = BoxDecoration(
    color: Colores.primary,
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(Dimens.radiusGeneral),
        bottomLeft: Radius.circular(Dimens.radiusGeneral)),
  );

  static Decoration darkOpacity = BoxDecoration(
    color: Colors.black.withAlpha(60),
    borderRadius: BorderRadius.all(Radius.circular(Dimens.radiusGeneral)),
  );
}
