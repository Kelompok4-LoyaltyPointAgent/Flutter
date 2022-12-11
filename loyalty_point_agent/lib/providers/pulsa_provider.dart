import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:loyalty_point_agent/models/pulsa_model.dart';
import 'package:loyalty_point_agent/services/pulsa_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class PulsaProvider extends ChangeNotifier {
  final PulsaService dataPulsa = PulsaService();

  PulsaModel? data;

  List<Datum> get recommended =>
      data!.data!.where((element) => element.recommended == true).toList();
  MyState myState = MyState.loading;

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
}
