import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:loyalty_point_agent/models/pulsa_model.dart';
import 'package:loyalty_point_agent/services/pulsa_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class PulsaProvider extends ChangeNotifier {
  final PulsaService dataPulsa = PulsaService();

  PulsaModel? data;
  MyState myState = MyState.loading;

  Future fetchPulsa() async {
    myState = MyState.loading;
    notifyListeners();
    try {
      data = await dataPulsa.getPaketData();

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
