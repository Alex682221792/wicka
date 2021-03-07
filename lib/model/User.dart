class User {
  String id;
  String name;
  String email;
  String photo;
  bool isActive;
  String password;

  User(
      {this.id,
      this.name,
      this.email,
      this.photo,
      this.isActive,
      this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        photo: json['photo'],
        isActive: json['isActive'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'email': this.email,
        'photo': this.photo,
        'isActive': this.isActive,
        'password': this.password
      };
}
