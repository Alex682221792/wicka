import 'dart:convert';

import 'package:wicka/api/services/BaseAPI.dart';
import 'package:wicka/model/Address.dart';
import 'package:wicka/model/Catalog.dart';
import 'package:wicka/model/Product.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';

class ProductAPI extends BaseRouteAPI {
  ProductAPI() {
    super.apiName = 'product';
  }

  Future<List<Product>> getDailySuggestion() async {
    var response = await this.getData('daily-suggestion', headers: <String, String>{
      'Authorization': await SessionUserSP().getToken(),
    });
    if (response.success) {
      return List<dynamic>.from(json.decode(response.result))
          .map((e) => Product.fromJson(e)).toList();
    }
    return null;
  }

  Future<List<Product>> getProductsByType(String typeId) async {
    var response = await this.getData('by-type-id/$typeId');
    if (response.success) {
      return List<dynamic>.from(json.decode(response.result))
          .map((e) => Product.fromJson(e)).toList();
    }
    return null;
  }
}
