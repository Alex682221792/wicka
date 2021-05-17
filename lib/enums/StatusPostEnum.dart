import 'package:flutter_svg/flutter_svg.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';

enum StatusOrderEnum { PENDING, ON_THE_WAY, COMPLETED }

class StatusOrderHelper {
  String getVal(StatusOrderEnum status) {
    switch (status) {
      case StatusOrderEnum.PENDING:
        return "Preparando orden";
      case StatusOrderEnum.ON_THE_WAY:
        return "En camino";
      case StatusOrderEnum.COMPLETED:
        return "Entregado";
    }
  }

  SvgPicture getIcon(StatusOrderEnum status){
    switch(status){
      case StatusOrderEnum.PENDING:
        return SvgPicture.asset(
            "assets/icons/waiting_ic.svg",
            color: Colores.primary,
            width: Dimens.sizeIcons
        );
      case StatusOrderEnum.ON_THE_WAY:
        return SvgPicture.asset(
            "assets/icons/on_the_way_ic.svg",
            color: Colores.customBlue,
            width: Dimens.sizeIcons
        );
      case StatusOrderEnum.COMPLETED:
        return SvgPicture.asset(
            "assets/icons/completed_ic.svg",
            color: Colores.customGreen,
            width: Dimens.sizeIcons
        );
    }
  }
}
