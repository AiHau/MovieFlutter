import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie/src/model/in_theater_model.dart';

class ApiService {
  Future<Movie> getMovieData() async {
    const String url = 'https://api.themoviedb.org/3';
    Client client = Client();
    final response = await client.get(Uri.parse(
        '$url/movie/now_playing?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&page=2'));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data == null) {
      throw (Exception);
    }
    final moviePlaying = Movie.fromJson(data);
    return moviePlaying;
  }
}
