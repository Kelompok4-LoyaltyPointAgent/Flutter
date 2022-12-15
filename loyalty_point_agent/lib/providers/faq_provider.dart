import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:loyalty_point_agent/models/faq_model.dart';
import 'package:loyalty_point_agent/services/faq_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class FaqProvider extends ChangeNotifier {
  final FaqService service = FaqService();

  FaqModel? data;

  List<Datum> get pusatBantuan => data!.data
      .where((element) => element.category == 'Pusat Bantuan')
      .toList();

  List<Datum> get pulsa =>
      data!.data.where((element) => element.category == 'Pulsa').toList();

  List<Datum> get paketData =>
      data!.data.where((element) => element.category == 'Paket Data').toList();

  List<Datum> get holaPoin =>
      data!.data.where((element) => element.category == 'Lah').toList();

  List<Datum> get layanan =>
      data!.data.where((element) => element.answer == "gue nanya").toList();

  MyState myState = MyState.loading;

  Future fetchData() async {
    // myState = MyState.loading;
    // notifyListeners();
    try {
      data = await service.getFaq();

      // myState = MyState.loaded;
      // notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      // myState = MyState.failed;
      // notifyListeners();
    }
  }
}
