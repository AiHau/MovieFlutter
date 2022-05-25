import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:http/http.dart';
import 'package:movie/src/model/detail_movie_model.dart';

class ApiDeatailMovie {
  final Dio _dio = Dio();
  final String url = 'https://api.themoviedb.org/3';
  Future<DetailMovie> getDetailMovieData(String id) async {
    Client client = Client();
    final response = await client.get(Uri.parse(
        '$url/movie/$id?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=credits'));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data == null) {
      throw (Exception);
    }
    final movieDetail = DetailMovie.fromJson(data);
    movieDetail.trailerId = await getYoutubeId(id);
    return movieDetail;
  }

  Future<String> getYoutubeId(String id) async {
    try {
      final response = await _dio.get(
          '$url/movie/$id/videos?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=credits');
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
