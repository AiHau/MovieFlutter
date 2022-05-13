import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie/src/model/detail_movie_model.dart';
import 'package:movie/src/model/in_theater_model.dart';

class ApiDeatailMovie {
  Future<DetailMovie> getDetailMovieData(String id) async {
    const String url = 'https://api.themoviedb.org/3';
    Client client = Client();
    final response = await client.get(Uri.parse(
        '$url/movie/$id?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&page=2'));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data == null) {
      throw (Exception);
    }
    final movieUpcoming = DetailMovie.fromJson(data);
    return movieUpcoming;
  }
}
