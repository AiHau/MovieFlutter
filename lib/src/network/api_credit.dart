import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie/src/model/credit_model.dart';

class ApiCredit {
  Future<Credit> getCreditData() async {
    const String url = 'https://api.themoviedb.org/3';
    Client client = Client();
    final response = await client.get(Uri.parse(
        '$url/movie/628900?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=credits&page=2'));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data == null) {
      throw (Exception);
    }
    final actor = Credit.fromJson(data);
    return actor;
  }
}
