class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? newPassword;
  final String? confirmPassword;
  final String? poin;
  final String? token;
  final String? number;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.newPassword,
    this.confirmPassword,
    this.poin,
    this.token,
    this.number,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        poin: json['points'].toString(),
        password: json['old_password'],
        newPassword: json['new_password'],
        confirmPassword: json['confirm_password'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() {
    return {
      'old_password': password,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
    };
  }
}
