import 'dart:convert';

import 'package:wicka/api/services/BaseAPI.dart';
import 'package:wicka/model/Address.dart';
import 'package:wicka/model/Catalog.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';

class CatalogAPI extends BaseRouteAPI {
  CatalogAPI() {
    super.apiName = 'catalog';
  }

  Future<List<Catalog>> getCatalogBySuccessorId(String catalogId) async {
    var response = await this.getData('by-successor-id/$catalogId', headers: <String, String>{
      'Authorization': await SessionUserSP().getToken(),
    });
    if (response.success) {
      return List<dynamic>.from(json.decode(response.result))
          .map((e) => Catalog.fromJson(e)).toList();
    }
    return null;
  }
}
