import 'package:wicka/enums/StatusPostEnum.dart';

class Order {
  String id;
  String number;
  String date;
  StatusOrderEnum status;
  String referencePlace;
  double latitude;
  double longitude;

  Order(
      {this.id,
      this.date,
      this.status,
      this.referencePlace,
      this.latitude,
      this.longitude,
      this.number});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'],
        date: json['date'],
        status: json['status'],
        referencePlace: json['referencePlace'],
        latitude: double.parse(json['latitude']),
        longitude: double.parse(json['longitude']),
        number: json["number"]);
  }

  Map<String, dynamic> toJson() {
    var json = {
      'id': this.id,
      'date': this.date,
      'status': this.status,
      'referencePlace': this.referencePlace,
      'latitude': this.latitude,
      'longitude': this.longitude,
      "number": this.number
    };
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
