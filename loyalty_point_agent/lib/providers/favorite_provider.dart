import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loyalty_point_agent/models/favorite_model.dart';
import 'package:loyalty_point_agent/services/favorite_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class FavoritProvider extends ChangeNotifier {
  final FavoriteService service = FavoriteService();

  FavoriteModel? data;

  MyState myState = MyState.loading;

  Future fetchFavorite() async {
    myState = MyState.loading;
    notifyListeners();
    try {
      data = await service.getFavorite();

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

  Future sendFavorite(String id) async {
    myState = MyState.loading;
    notifyListeners();
    try {
      await service.postFavorit(id);

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

  // MyState delFavState = MyState.loading;
  Future removeFavorite(String id) async {
    // delFavState = MyState.loading;
    myState = MyState.loading;
    notifyListeners();
    try {
      await service.deleteFavorite(id);
      notifyListeners();

      // delFavState = MyState.loaded;
      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      // delFavState = MyState.failed;
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
