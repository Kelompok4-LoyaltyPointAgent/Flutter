import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loyalty_point_agent/models/pembelian_model.dart';
import 'package:loyalty_point_agent/models/transaction_model.dart';
import 'package:loyalty_point_agent/services/transaction_service.dart';
import 'package:loyalty_point_agent/utils/finite_state.dart';

class TransactionProvider extends ChangeNotifier {
  final TransactionService service = TransactionService();
  TransactionModel? result;
  PembelianModel? pembelian;

  MyState myState = MyState.initial;

  Future transaction(TransactionModel data) async {
    try {
      // myState = MyState.loading;
      // notifyListeners();

      result = await service.postTransaction(data);

      // myState = MyState.loaded;
      // notifyListeners();
      //return pembelian;
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      // myState = MyState.failed;
      // notifyListeners();
    }
  }
}
