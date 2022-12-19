import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:loyalty_point_agent/models/pulsa_model.dart';
import 'package:loyalty_point_agent/services/pulsa_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class PulsaProvider extends ChangeNotifier {
  final PulsaService dataPulsa = PulsaService();

  PulsaModel? data;
  PulsaModel? filterData;
  Datum? dataById;
  PulsaModel? besar;
  PulsaModel? kecil;

  List<Datum> get recommended => data!.data!
      .where((element) => element.recommended == true && element.stock != 0)
      .toList();
  MyState myState = MyState.initial;

  Future fetchPulsa() async {
    myState = MyState.loading;
    notifyListeners();
    try {
      data = await dataPulsa.getPulsa();

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

  MyState myState2 = MyState.initial;
  Future fetchPulsaByID(String id) async {
    myState2 = MyState.loading;
    notifyListeners();
    try {
      dataById = await dataPulsa.getPulsaByID(id);

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
  Future fetchFilterPulsa(String filter) async {
    myState3 = MyState.loading;
    notifyListeners();
    try {
      filterData = await dataPulsa.getFilterPulsa(filter);

      besar = await dataPulsa.getFilterPulsa(filter);

      besar!.data!.sort((a, b) => b.price!.compareTo(a.price!));
      notifyListeners();

      kecil = await dataPulsa.getFilterPulsa(filter);
      kecil!.data!.sort((a, b) => a.price!.compareTo(b.price!));
      notifyListeners();

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
