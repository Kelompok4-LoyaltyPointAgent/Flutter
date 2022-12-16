class LoginModel {
  final String? email;
  final String? password;
  final String? pin;

  LoginModel({this.email, this.password, this.pin});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'pin': pin,
    };
  }
}
