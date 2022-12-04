class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        token: json['token'],
      );
}
