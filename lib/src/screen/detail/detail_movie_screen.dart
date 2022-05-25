import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie/src/model/credit_model.dart';
import 'package:movie/src/model/detail_movie_model.dart';
import 'package:movie/src/network/api_credit.dart';
import 'package:movie/src/network/api_detail_movie.dart';
import 'package:movie/src/screen/detail/components/body.dart';

class DetailMovieScreen extends StatefulWidget {
  final int? id;
  final String? name;

  const DetailMovieScreen({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  late Future<DetailMovie> movieDetail;
  late Future<Credit> actor;
  late ApiDeatailMovie apiDetailMovie;
  late ApiCredit apiCredit;
  late String urlImage;
  late String urlImage2;

  @override
  void initState() {
    super.initState();
    apiDetailMovie = ApiDeatailMovie();
    movieDetail = apiDetailMovie.getDetailMovieData(widget.id.toString());
    apiCredit = ApiCredit();
    actor = apiCredit.getCreditData();

    urlImage2 = 'https://image.tmdb.org/t/p/w45';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          backgroundColor:
              const Color.fromARGB(255, 212, 208, 208).withAlpha(300),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: FutureBuilder<DetailMovie>(
              future: movieDetail,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('loi: ${snapshot.error.toString()}'),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${snapshot.data?.originalTitle}',
                    style: const TextStyle(color: Colors.white),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          actions: const []),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<DetailMovie>(
                future: movieDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('loi: ${snapshot.error.toString()}'),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return InheritedWidgetDetailMovie(
                      snapshot,
                      widget.id,
                      child: const BodyDetailMovie(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class InheritedWidgetDetailMovie extends InheritedWidget {
  // ignore: use_key_in_widget_constructors
  const InheritedWidgetDetailMovie(this.snapshot, this.id,
      {required Widget child})
      : super(child: child);
  final AsyncSnapshot<DetailMovie>? snapshot;
  final int? id;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static InheritedWidgetDetailMovie? of(BuildContext context) {
    // 5
    return context
        .dependOnInheritedWidgetOfExactType<InheritedWidgetDetailMovie>();
  }
}
