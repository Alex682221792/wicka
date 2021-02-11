import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/view/widgets/CornerRadiusImage.dart';

class PostulantItem extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Row(children: [
          CornerRadiusImage(
              size: 40.0,
              radiusCorner: 20.0,
              url:
                  "https://mk0ziglar4ifu5ixq7cx.kinstacdn.com/wp-content/uploads/2016/09/michelle-prince-profile-img.png"),
          Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nombre de contratante",
                        style: TextStyles.normalStyle),
                    Text("Ofertó hoy", style: TextStyles.sectionTitleStyle)
                  ])),
          Expanded(
              flex: 1,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                RatingBarIndicator(
                    direction: Axis.horizontal,
                    rating: 3.8,
                    itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    itemCount: 5,
                    itemSize: 20.0),
                Text("34 Votos", style: TextStyles.sectionTitleStyle)
              ]))
        ]));
  }
}
