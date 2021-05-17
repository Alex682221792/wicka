import 'package:flutter/cupertino.dart';
import 'package:wicka/api/services/CatalogAPI.dart';
import 'package:wicka/api/services/ProductAPI.dart';
import 'package:wicka/controller/BaseController.dart';
import 'package:wicka/logic/base/Constants.dart';
import 'package:wicka/model/Catalog.dart';
import 'package:wicka/model/Product.dart';
import 'package:get/get.dart';

class FinderController extends BaseController {
  var isSearchMode = false.obs;

  Future<List<Catalog>> getProductTypes() async {
    return await CatalogAPI()
        .getCatalogBySuccessorId(Constants.productTypeUUID);
  }

  Future<List<Product>> getDailySuggestion() async {
    return await ProductAPI().getDailySuggestion();
  }

  Future<List<Product>> getProductByType(String typeId) async {
    return await ProductAPI().getProductsByType(typeId);
  }

  void updateSearchMode(bool value){
    this.isSearchMode.value = value;
  }
}
