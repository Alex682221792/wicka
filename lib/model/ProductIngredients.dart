import 'package:wicka/model/Ingredient.dart';
import 'package:wicka/logic/base/extentions.dart';

class ProductIngredients {
  String id;
  String ingredientId;
  String productId;
  double price;
  int minimum;
  int maximum;
  bool isActive;
  bool isRemovable;
  Ingredient ingredient;
  int count;

  ProductIngredients(
      {this.id,
      this.ingredientId,
      this.productId,
      this.price,
      this.minimum,
      this.maximum,
      this.isActive,
      this.isRemovable,
      this.ingredient,
      this.count});

  factory ProductIngredients.fromJson(Map<String, dynamic> json) {

    return ProductIngredients(
        id: json['id'],
        ingredientId: json["ingredientId"],
        productId: json["productId"],
        price: double.parse(json['price'].toString().replaceAll(",", ".")),
        minimum: json["minimum"],
        count: json["minimum"],
        maximum: json["maximum"],
        isActive:  json["isActive"].toString().parseBool(),
        isRemovable: json["isRemovable"].toString().parseBool(),
        ingredient: Ingredient.fromJson(json["ingredient"])
    );
  }
}
