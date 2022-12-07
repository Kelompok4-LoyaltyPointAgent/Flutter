import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loyalty_point_agent/models/user_model.dart';
import 'package:loyalty_point_agent/services/user_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class UserProvider extends ChangeNotifier {
  final UserService service = UserService();

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

  Future changePassword(UserModel data) async {
    myState = MyState.loading;
    notifyListeners();
    try {
      myState = MyState.loading;
      notifyListeners();

      final result = await service.changePassword(data);

      myState = MyState.loaded;
      notifyListeners();
      return result;
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
