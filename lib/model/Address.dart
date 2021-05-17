class Address {
  String id;
  String alias;
  String reference;
  String direction;
  double latitude;
  double longitude;

  Address({this.id, this.alias, this.reference, this.direction, this.latitude, this.longitude});


  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        id: json['id'],
        alias: json['alias'],
        reference: json['reference'],
        direction: json['direction'],
        latitude: double.parse(json['latitude']),
        longitude: double.parse(json['longitude']));
  }

  Map<String, dynamic> toJson() {
    var json = {
      'id': this.id,
      'alias': this.alias,
      'reference': this.reference,
      'direction': this.direction,
      'latitude': this.latitude,
      'longitude': this.longitude
    };
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
