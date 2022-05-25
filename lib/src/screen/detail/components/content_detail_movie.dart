import 'package:flutter/material.dart';
import 'package:movie/src/screen/detail/detail_movie_screen.dart';

class ContentDetailMovie extends StatefulWidget {
  const ContentDetailMovie({Key? key}) : super(key: key);

  @override
  State<ContentDetailMovie> createState() => _ContentDetailMovieState();
}

class _ContentDetailMovieState extends State<ContentDetailMovie> {
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedWidgetDetailMovie.of(context)?.snapshot;
    final yearMovie = getYearMovie('${snapshot?.data?.releaseDate}');
    return Row(
      children: [
        Text(
          yearMovie,
          style: const TextStyle(color: Colors.white),
        ),
        const Text(
          ' • ',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '${snapshot?.data?.runtime?.toString()}',
          style: const TextStyle(color: Colors.white),
        ),
        const Text(' min', style: TextStyle(color: Colors.white)),
      ],
    );
  }

  String getYearMovie(String s) {
    var year = s.split('-');
    return year[0];
  }
}
