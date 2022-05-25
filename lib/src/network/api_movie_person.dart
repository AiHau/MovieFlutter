import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie/src/model/movies_person_model.dart';

class ApiMoviePerson {
  Future<MoviePerson> getMoviePersonData(String id) async {
    const String url = 'https://api.themoviedb.org/3';
    Client client = Client();
    final response = await client.get(Uri.parse(
        '$url/person/$id/movie_credits?api_key=d79d9f8467a0e6d7b24624c522cb2ab3'));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data == null) {
      throw (Exception);
    }
    final moviePerson = MoviePerson.fromJson(data);
    return moviePerson;
  }
}
