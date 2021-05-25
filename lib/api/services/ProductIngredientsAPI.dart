import 'dart:convert';

import 'package:wicka/api/services/BaseAPI.dart';
import 'package:wicka/model/Address.dart';
import 'package:wicka/model/Catalog.dart';
import 'package:wicka/model/Product.dart';
import 'package:wicka/model/ProductIngredients.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';

class ProductIngredientsAPI extends BaseRouteAPI {
  ProductIngredientsAPI() {
    super.apiName = 'product-ingredients';
  }

  Future<List<ProductIngredients>> getIngredientsByProductId(String productId) async {
    var response = await this.getData('by-product-id/$productId');
    if (response.success) {
      return List<dynamic>.from(json.decode(response.result))
          .map((e) => ProductIngredients.fromJson(e)).toList();
    }
    return null;
  }
}
