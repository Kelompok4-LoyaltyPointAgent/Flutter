class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? poin;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.poin,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        poin: json['points'].toString(),
        password: json['password'],
        token: json['token'],
      );
}
