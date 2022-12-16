class RegisterModel {
  final String? name;
  final String? email;
  final String? password;

  RegisterModel({
    this.name,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
