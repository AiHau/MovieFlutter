import 'package:flutter/material.dart';
import 'package:movie/src/screen/detail/components/cast_detail_movie.dart';
import 'package:movie/src/screen/detail/components/content_detail_movie.dart';
import 'package:movie/src/screen/detail/components/content_movie.dart';
import 'package:movie/src/screen/detail/components/director_detail_movie.dart';
import 'package:movie/src/screen/detail/components/icon_detail_movie.dart';
import 'package:movie/src/screen/detail/components/image_ralate_movie.dart';
import 'package:movie/src/screen/detail/components/list_info_movie.dart';
import 'package:movie/src/screen/detail/components/rate_detail_movie.dart';
import 'package:movie/src/screen/detail/detail_movie_screen.dart';

class BodyDetailMovie extends StatefulWidget {
  const BodyDetailMovie({Key? key}) : super(key: key);

  @override
  State<BodyDetailMovie> createState() => _BodyDetailMovieState();
}

class _BodyDetailMovieState extends State<BodyDetailMovie> {
  @override
  Widget build(BuildContext context) {
    const urlImage = 'https://image.tmdb.org/t/p/original';
    final snapshot = InheritedWidgetDetailMovie.of(context)?.snapshot;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network("$urlImage${snapshot?.data?.posterPath}"),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: const ContentDetailMovie(),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 40),
            child: Text(
              '${snapshot?.data?.originalTitle?.toUpperCase()}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const iconDetailMovie(),
          const RateDetailMovie(),
          const ImageRalateMovie(),
          const ContentMovie(),
          Container(
            height: 50,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 23, 22, 22)),
            padding: const EdgeInsets.only(left: 10, right: 8),
            margin: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Custom Lists",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 200),
                  child: const Text(
                    "None",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const InkWell(
                  child: Icon(Icons.arrow_forward_ios,
                      color: Colors.grey, size: 16),
                )
              ],
            ),
          ),
          const ListInformationMovie(),
          const DirectorDetaMovie(),
          const CastDetailMovie(),
        ],
      ),
    );
  }
}
