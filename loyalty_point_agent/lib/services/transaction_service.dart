import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/invoice_model.dart';
import 'package:loyalty_point_agent/models/payment_model.dart';
import 'package:loyalty_point_agent/models/transaction_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionService {
  final Dio _dio = Dio();

  Future<PaymentModel> postTransaction(TransactionModel data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.post(
        Urls.baseUrl + Urls.transaction,
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      final pembelian = PaymentModel.fromJson(response.data);

      return pembelian;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<InvoiceModel> payPendingTransaction(String data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.get(
        '${Urls.baseUrl}${Urls.paypending}/$data',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      final link = InvoiceModel.fromJson(response.data);

      return link;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
