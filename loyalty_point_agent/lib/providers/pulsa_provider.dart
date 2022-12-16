import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:loyalty_point_agent/models/pulsa_model.dart';
import 'package:loyalty_point_agent/services/pulsa_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class PulsaProvider extends ChangeNotifier {
  final PulsaService dataPulsa = PulsaService();

  PulsaModel? data;
  Datum? dataById;
  PulsaModel? besar;
  PulsaModel? kecil;

  List<Datum> get recommended =>
      data!.data!.where((element) => element.recommended == true).toList();
  MyState myState = MyState.initial;

  Future fetchPulsa() async {
    myState = MyState.loading;
    notifyListeners();
    try {
      data = await dataPulsa.getPulsa();

      besar = await dataPulsa.getPulsa();

      besar!.data!.sort((a, b) => b.price!.compareTo(a.price!));
      notifyListeners();

      kecil = await dataPulsa.getPulsa();
      kecil!.data!.sort((a, b) => a.price!.compareTo(b.price!));
      notifyListeners();

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
}
