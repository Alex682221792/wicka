import 'package:flutter/material.dart';
import 'package:kmello/view/widgets/ImageViewer.dart';

class CornerRadiusImage extends StatelessWidget {
  String _url;
  double _radiusCorner;
  double _size;

  CornerRadiusImage({String url, double radiusCorner, double size}) {
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
                  child: Image.network(this._url,
                      fit: BoxFit.cover,
                      width: this._size,
                      height: this._size))),
          onTap: () {
            this.viewImage(context);
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