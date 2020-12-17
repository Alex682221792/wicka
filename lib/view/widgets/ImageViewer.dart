import 'package:flutter/material.dart';
import 'package:kmello/view/widgets/CircleButton.dart';

class ImageViewer extends StatelessWidget {
  String urlImg;
  String numberPhone;

  ImageViewer({this.urlImg, this.numberPhone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
                alignment: AlignmentDirectional.center,
                child: Hero(
                    tag: "image_${this.urlImg}",
                    child: Image.network(this.urlImg,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.95))),
            Container(
                height: MediaQuery.of(context).size.height,
                alignment: AlignmentDirectional.bottomCenter,
                child: CircleButton(
                    colorButton: Colors.grey[700],
                    colorIcon: Colors.white,
                    icon: Icons.close,
                    size: 45.0,
                    onPress: () {
                      Navigator.pop(context);
                    }))
          ],
        ));
  }
}
