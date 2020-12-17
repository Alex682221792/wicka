import 'package:flutter/material.dart';
import 'package:kmello/resources/styles/gradients.dart';
import 'package:kmello/resources/styles/text-styles.dart';
import 'package:kmello/resources/values/colors.dart';

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

  static Decoration tabBarShadow = BoxDecoration(
      gradient: Gradients.wavesGradient,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.black26, offset: Offset(0.0, 1.0), blurRadius: 4.0)
      ]);

  static Decoration topBarShadow = BoxDecoration(
      color: Colores.tertiary,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      boxShadow: [
        BoxShadow(
            color: Colors.black26, offset: Offset(0.0, 0.0), blurRadius: 4.0)
      ]);

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
}
