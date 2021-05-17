class ConfigCatalog {
  String id;
  String label;
  String value;

  ConfigCatalog({this.id, this.label, this.value});

  factory ConfigCatalog.fromJson(Map<String, dynamic> json) {
    return ConfigCatalog(
        id: json['id'], label: json['label'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    var json = {'id': this.id, 'label': this.label, 'value': this.value};
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
