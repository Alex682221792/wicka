import 'package:wicka/model/Category.dart';

class Product {
  String id;
  String name;
  String description;
  String photo;
  String photoBgless;
  double price;
  Category type;

  Product(
      {this.id,
      this.name,
      this.description,
      this.photo,
      this.photoBgless,
      this.price,
      this.type});
}
