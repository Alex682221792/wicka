class PaymentMethod {
  String id;
  String alias;
  String holderName;
  String number;
  String expiryYear;
  String expiryMonth;
  String cvv;
  bool isPrincipal;

  PaymentMethod(
      {this.id,
      this.alias,
      this.holderName,
      this.number,
      this.expiryMonth,
      this.expiryYear,
      this.cvv,
      this.isPrincipal});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
        id: json['id'],
        holderName: json['holderName'],
        alias: json['alias'],
        number: json['number'],
        expiryYear: json['expiryYear'],
        expiryMonth: json['expiryMonth'],
        cvv: json['cvv'],
        isPrincipal: json['isPrincipal']);
  }

  Map<String, dynamic> toJson() {
    var json = {
      'id': this.id,
      'alias': this.alias,
      'holderName': this.holderName,
      'number': this.number,
      'expiryMonth': this.expiryMonth,
      'expiryYear': this.expiryYear,
      'cvv': this.cvv,
      'isPrincipal': this.isPrincipal
    };
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
