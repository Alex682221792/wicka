import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';

class ItemMenuWidget extends StatelessWidget {
  IconData icon;
  String label;
  String badgeText;
  VoidCallback onTap;

  ItemMenuWidget({this.icon, this.label, this.onTap, this.badgeText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onTap,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: Dimens.spaceBetweenFields * 0.5),
            child: Row(
              children: [
                Icon(icon, color: Colores.inactive, size: Dimens.sizeIcons),
                Badge(
                    showBadge: badgeText.isNotEmpty,
                    toAnimate: true,
                    animationType: BadgeAnimationType.scale,
                    child: Padding(
                        child: Text(label, style: TextStyles.normalStyle),
                        padding: EdgeInsets.only(
                            left: Dimens.spaceBetweenFields * 0.5,
                            right: Dimens.spaceBetweenFields)),
                    badgeColor: Colores.primary,
                    badgeContent:
                        Text(badgeText, style: TextStyles.whiteLightTextStyle)
                    // margin: EdgeInsets.only(right: Dimens.spaceBetweenFields)
                    )
              ],
            )));
  }
}
