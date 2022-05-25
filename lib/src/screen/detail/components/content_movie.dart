import 'package:flutter/material.dart';
import 'package:movie/src/screen/detail/detail_movie_screen.dart';

class ContentMovie extends StatefulWidget {
  const ContentMovie({Key? key}) : super(key: key);

  @override
  State<ContentMovie> createState() => _ContentMovieState();
}

class _ContentMovieState extends State<ContentMovie> {
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedWidgetDetailMovie.of(context)?.snapshot;
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 23, 22, 22)),
      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 30),
      child: Text(
        '${snapshot?.data?.overview}',
        style: const TextStyle(color: Colors.white, height: 1.4),
      ),
    );
  }
}
