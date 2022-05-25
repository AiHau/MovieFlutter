import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie/src/model/profile_model.dart';

class ApiProfileMovie {
  Future<ProfileMovie> getDetailProfileData(String id) async {
    const String url = 'https://api.themoviedb.org/3';
    Client client = Client();
    final response = await client.get(
        Uri.parse('$url/person/$id?api_key=d79d9f8467a0e6d7b24624c522cb2ab3'));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data == null) {
      throw (Exception);
    }
    final movieProfile = ProfileMovie.fromJson(data);
    return movieProfile;
  }
}
