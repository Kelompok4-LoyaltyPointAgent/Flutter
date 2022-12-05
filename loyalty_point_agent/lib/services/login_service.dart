import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/login_model.dart';
import 'package:loyalty_point_agent/models/user_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<UserModel> login(LoginModel data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.login,
        data: data,
      );

      print(response.data['data']);
      UserModel user = UserModel.fromJson(response.data);
      await prefs.setString("token", response.data['data']["token"]);
      token = response.data['data']['token'];
      //await storeCredentialToLocal(user);
      print(token);
      return user;
    } on DioError catch (_) {
      rethrow;
    }
  }

  // Future<void> storeCredentialToLocal(UserModel user) async {
  //   try {
  //     const storage = FlutterSecureStorage();
  //     await storage.write(key: 'token', value: user.token);
  //     await storage.write(key: 'email', value: user.email);
  //     await storage.write(key: 'password', value: user.password);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<LoginModel> getCredentialFromLocal() async {
  //   try {
  //     const storage = FlutterSecureStorage();
  //     Map<String, String> values = await storage.readAll();
  //     print(values);
  //     if (values['email'] == null || values['password'] == null) {
  //       throw '';
  //     } else {
  //       final LoginModel data = LoginModel(
  //         email: values['email'],
  //         password: values['password'],
  //       );

  //       return data;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<String> getToken() async {
  //   String token = '';
  //   const storage = FlutterSecureStorage();
  //   String? value = await storage.read(key: 'token');

  //   if (value != null) {
  //     token = 'Bearer ' + value;
  //   }

  //   return token;
  // }

  // Future<void> clearLocalStorage() async {
  //   const storage = FlutterSecureStorage();
  //   await storage.deleteAll();
  // }

  // Future<UserModel> fetchUsers() async {
  //   final storage = await SharedPreferences.getInstance();
  //   final auth = storage.getString('token');
  //   try {
  //     final response = await _dio.get(Urls.baseUrl + Urls.user,
  //         options: Options(headers: {
  //           "Authorization": "Bearer $auth",
  //         }));

  //     print(auth);
  //     return UserModel.fromJson(response.data['data']);
  //   } on DioError catch (_) {
  //     rethrow;
  //   }
  // }
}
