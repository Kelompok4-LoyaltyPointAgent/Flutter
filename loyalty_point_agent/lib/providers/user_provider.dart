import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loyalty_point_agent/models/user_model.dart';
import 'package:loyalty_point_agent/services/login_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class UserProvider extends ChangeNotifier {
  final LoginService service = LoginService();

  UserModel? user;
  MyState myState = MyState.loading;

  Future fetchUsersData() async {
    myState = MyState.loading;
    notifyListeners();
    try {
      user = await service.fetchUser();

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
