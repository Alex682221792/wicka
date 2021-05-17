import 'package:wicka/model/Catalog.dart';

class Product {
  String id;
  String name;
  String description;
  String photo;
  double price;
  Catalog type;

  Product(
      {this.id,
      this.name,
      this.description,
      this.photo,
      this.price,
      this.type});


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        photo: json['photo'],
        price: double.parse(json['price'].toString().replaceAll(",", "."))
    );
  }

  Map<String, dynamic> toJson() {
    var json = {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'photo': this.photo,
      'price': this.price
    };
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
