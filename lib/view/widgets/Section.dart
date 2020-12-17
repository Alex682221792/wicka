import 'package:flutter/cupertino.dart';
import 'package:kmello/resources/styles/text-styles.dart';

class Section extends StatelessWidget {
  String title;
  List<Widget> children;

  Section({this.title, this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Align(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyles.sectionTitleStyle,
            ),
            alignment: Alignment.centerLeft,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Column(
                children: children,
              ))
        ],
      ),
    );
  }
}
