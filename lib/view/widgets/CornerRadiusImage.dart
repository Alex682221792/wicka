import 'package:flutter/material.dart';
import 'package:wicka/view/widgets/ImageViewer.dart';

class CornerRadiusImage extends StatelessWidget {
  String _url;
  double _radiusCorner;
  double _size;
  bool ableOnTap;

  CornerRadiusImage({String url, double radiusCorner, double size, this.ableOnTap = true}) {
    this._url = url;
    this._radiusCorner = radiusCorner;
    this._size = size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2.0),
        child: GestureDetector(
          child: ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(this._radiusCorner)),
              child: Hero(
                  tag: "image_${this._url}",
                  child: FadeInImage.assetNetwork(fit: BoxFit.cover,
                      placeholder: 'assets/logo_wicka.png',
                      width: this._size,
                      height: this._size,
                      image: this._url))),
          onTap: () {
            if(ableOnTap) {
              this.viewImage(context);
            }
          },
        ));
  }

  void viewImage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewer(urlImg: this._url),
      ),
    );
  }
}
