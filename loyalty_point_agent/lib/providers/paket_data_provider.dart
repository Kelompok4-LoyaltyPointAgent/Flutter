import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loyalty_point_agent/models/paket_data_model.dart';
import 'package:loyalty_point_agent/services/paket_data_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class PaketDataProvider extends ChangeNotifier {
  final PaketDataService service = PaketDataService();

  PaketDataModel? data;
  List<Datum> get recommended =>
      data!.data!.where((element) => element.recommended == true).toList();
  MyState myState = MyState.loading;

  Future fetchPaketData() async {
    myState = MyState.loading;
    notifyListeners();
    try {
      data = await service.getPaketData();

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
