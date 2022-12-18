class LoginModel {
  final String? email;
  final String? password;
  final String? checkPassword;
  final String? pin;

  LoginModel({this.email, this.password, this.pin, this.checkPassword});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'pin': pin,
      'check_password': checkPassword,
    };
  }
}
