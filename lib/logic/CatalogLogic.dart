import 'package:flutter/cupertino.dart';
import 'package:wicka/api/services/CatalogAPI.dart';
import 'package:wicka/model/Catalog.dart';

class CatalogLogic {
  var addressApi = CatalogAPI();

  Future<List<Catalog>> getCatalogBySuccessorId(String catalogId, VoidCallback onFailure) async{
    return await addressApi.getCatalogBySuccessorId(catalogId);
  }
}
