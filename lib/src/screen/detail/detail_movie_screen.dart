import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie/src/model/detail_movie_model.dart';
import 'package:movie/src/model/in_theater_model.dart';
import 'package:movie/src/network/api_detail_movie.dart';
import 'package:movie/src/network/api_service.dart';

class DetailMovieScreen extends StatefulWidget {
  final int? id;
  final String? name;
  const DetailMovieScreen({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  late Future<DetailMovie> movieUpcoming;
  late ApiDeatailMovie apiDetailMovie;
  late String urlImage;

  @override
  void initState() {
    super.initState();
    apiDetailMovie = ApiDeatailMovie();
    movieUpcoming = apiDetailMovie.getDetailMovieData(widget.id.toString());
    urlImage = 'https://image.tmdb.org/t/p/original';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 132, 130, 130).withAlpha(200),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Container(
              child: FutureBuilder<DetailMovie>(
                  future: movieUpcoming,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('loi: ${snapshot.error.toString()}'),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return Text(
                        '${snapshot.data?.originalTitle}',
                        style: const TextStyle(color: Colors.white),
                      );
                    } else {
                      return const Text("");
                    }
                  })),
          actions: []),
      body: Container(
          // child: Text(
          //   widget.id.toString(),
          //   style: TextStyle(color: Colors.white),
          // ),
          child: FutureBuilder<DetailMovie>(
              future: movieUpcoming,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('loi: ${snapshot.error.toString()}'),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Image.network("$urlImage${snapshot.data?.posterPath}");
                } else {
                  return Text(
                    '${snapshot.data?.originalTitle}',
                    style: TextStyle(color: Colors.white),
                  );
                }
              })),
    );
  }
}
