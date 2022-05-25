import 'package:flutter/material.dart';
import 'package:movie/src/model/detail_movie_model.dart';
import 'package:movie/src/network/api_detail_movie.dart';
import 'package:movie/src/screen/detail/detail_movie_screen.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class iconDetailMovie extends StatefulWidget {
  final int? id;
  const iconDetailMovie({Key? key, this.id}) : super(key: key);

  @override
  State<iconDetailMovie> createState() => _iconDetailMovieState();
}

// ignore: camel_case_types
class _iconDetailMovieState extends State<iconDetailMovie> {
  late Future<DetailMovie> movieDetail;
  late ApiDeatailMovie apiDetailMovie;
  @override
  void initState() {
    super.initState();
    apiDetailMovie = ApiDeatailMovie();
    movieDetail = apiDetailMovie.getDetailMovieData(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedWidgetDetailMovie.of(context)?.snapshot;
    final youtubeUrl =
        'https://www.youtube.com/embed/${snapshot?.data?.trailerId}';
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 19, 19, 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () async {
              try {
                // ignore: deprecated_member_use
                await launch(
                  youtubeUrl,
                  enableJavaScript: true,
                );
              } catch (e) {
                setState(() {
                  e.toString();
                });
                rethrow;
              }

              // ignore: deprecated_member_use
              if (await canLaunch(youtubeUrl)) {
                // ignore: deprecated_member_use
                throw ' $youtubeUrl';
              }
            },
            child: const Icon(
              Icons.play_circle_outlined,
              color: Colors.white,
              size: 50,
            ),
          ),
          const InkWell(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 50,
            ),
          ),
          const InkWell(
            child: Icon(
              Icons.ios_share,
              color: Colors.white,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
