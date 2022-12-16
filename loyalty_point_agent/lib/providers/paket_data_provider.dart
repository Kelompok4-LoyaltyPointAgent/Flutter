import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loyalty_point_agent/models/paket_data_model.dart';
import 'package:loyalty_point_agent/services/paket_data_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class PaketDataProvider extends ChangeNotifier {
  final PaketDataService service = PaketDataService();

  PaketDataModel? data;
  Datum? dataById;
  PaketDataModel? filterData;
  PaketDataModel? besar;
  PaketDataModel? kecil;
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

  MyState myState2 = MyState.loading;

  Future fetchFilterPaketData(String filter) async {
    myState2 = MyState.loading;
    notifyListeners();
    try {
      filterData = await service.getFilterPaketData(filter);

      besar = await service.getFilterPaketData(filter);
      besar!.data!.sort((a, b) => b.price.compareTo(a.price));
      notifyListeners();

      kecil = await service.getFilterPaketData(filter);

      kecil!.data!.sort((a, b) => a.price.compareTo(b.price));
      notifyListeners();

      myState2 = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState2 = MyState.failed;
      notifyListeners();
    }
  }

  MyState myState3 = MyState.initial;
  Future fetchPulsaByID(String id) async {
    myState3 = MyState.loading;
    notifyListeners();
    try {
      dataById = await service.getPaketDataByID(id);

      myState3 = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState3 = MyState.failed;
      notifyListeners();
    }
  }
}
