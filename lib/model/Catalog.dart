import 'package:wicka/model/ConfigCatalog.dart';

class Catalog {
  String id;
  String name;
  String detail;
  List<ConfigCatalog> config;

  Catalog({this.id, this.name, this.detail, this.config});

  factory Catalog.fromJson(Map<String, dynamic> json) {
    return Catalog(
        id: json['id'],
        name: json['name'],
        detail: json['detail'],
        config: List<dynamic>.from(json['config'])
            .map((e) => ConfigCatalog.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    var json = {
      'id': this.id,
      'name': this.name,
      'details': this.detail,
      'config': this.config
    };
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
