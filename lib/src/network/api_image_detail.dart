import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie/src/model/image_ralate_model.dart';

class ApiImageMovie {
  Future<ImageMovie> getDetailImageData(String id) async {
    const String url = 'https://api.themoviedb.org/3';
    Client client = Client();
    final response = await client.get(
        Uri.parse('$url/movie/$id/images?api_key=d79d9f8467a0e6d7b24624c522cb2ab3'));
    final data = jsonDecode(response.body) as Map<String, dynamic>?;
    if (data == null) {
      throw (Exception);
    }
    final movieImage = ImageMovie.fromJson(data);
    return movieImage ;
  }
}
