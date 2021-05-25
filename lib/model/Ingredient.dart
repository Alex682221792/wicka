class Ingredient {
  String id;
  String name;
  String icon;
  String details;
  bool isActive;

  Ingredient({this.id, this.name, this.icon, this.details, this.isActive});


  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        details: json['details'],
        isActive: json['isActive']
    );
  }
}