import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:loyalty_point_agent/models/pulsa_model.dart';
import 'package:loyalty_point_agent/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PulsaService {
  final Dio _dio = Dio();

  Future fetchPulsa() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    token = prefs.getString("token");
    try {
      final response = await _dio.get(
        'https://reqres.in/api/users/',
        // options: Options(
        //   headers: {
        //     "Authorization": "Bearer $token",
        //   },
        // ),
      );

      final List extactData = (jsonDecode(response.data))['data'];
      List<Data> data = extactData.map((e) => Data.fromJson(e)).toList();
      print(data);
      return data;

      //print(response.data['data']);
      //final List extactData = (jsonDecode(response.data))['data'];
      // final data = PulsaModel.fromJson(extactData);
      // List jsonResponse = json.decode(response.data['data']);
      // return jsonResponse.map((data) => PulsaModel.fromJson(data)).toList();
    } on DioError catch (_) {
      rethrow;
    }
  }
}
