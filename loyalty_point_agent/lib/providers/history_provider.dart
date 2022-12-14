import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loyalty_point_agent/models/history_model.dart';
import 'package:loyalty_point_agent/services/history_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class HistoryProvider extends ChangeNotifier {
  final HistoryService service = HistoryService();

  HistoryModel? data;

  List<Data>? get purchase =>
      data!.data!.where((element) => element.type == 'Purchase').toList();

  List<Data> get redeem => data!.data!
      .where((element) => element.type == 'Redeem' || element.type == 'Cashout')
      .toList();

  MyState myState = MyState.loading;

  Future fetchHistory() async {
    myState = MyState.loading;
    notifyListeners();
    try {
      data = await service.getHistory();

      // Sorting dari Backend katanya
      // data!.data!.sort((a, b) =>
      //     b.createdDate.toString().compareTo(a.createdDate.toString()));
      // notifyListeners();

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

  MyState myState2 = MyState.loading;

  Future cancel(String id) async {
    try {
      myState2 = MyState.loading;
      notifyListeners();

      await service.cancelTransaction(id);

      myState2 = MyState.loaded;
      notifyListeners();
      //return pembelian;
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState2 = MyState.failed;
      notifyListeners();
    }
  }
}
