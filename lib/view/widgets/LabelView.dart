import 'package:flutter/cupertino.dart';
import 'package:wicka/resources/styles/text-styles.dart';

class LabelView extends StatelessWidget {
  String title;
  String description;

  LabelView({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.title, style: TextStyles.labelViewTitleStyle),
          Text(this.description, style: TextStyles.normalStyle)
        ],
      ),
    );
  }
}
