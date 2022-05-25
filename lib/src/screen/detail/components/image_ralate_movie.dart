import 'package:flutter/material.dart';
import 'package:movie/src/model/image_ralate_model.dart';
import 'package:movie/src/network/api_image_detail.dart';
import 'package:movie/src/screen/detail/detail_movie_screen.dart';

class ImageRalateMovie extends StatefulWidget {
  const ImageRalateMovie({Key? key}) : super(key: key);

  @override
  State<ImageRalateMovie> createState() => _ImageRalateMovieState();
}

class _ImageRalateMovieState extends State<ImageRalateMovie> {
  late Future<ImageMovie> movieImage;
  late ApiImageMovie apiImageMovie;
  late String urlImage;
  @override
  void initState() {
    super.initState();

    apiImageMovie = ApiImageMovie();

    urlImage = 'https://image.tmdb.org/t/p/w200';
  }

  @override
  Widget build(BuildContext context) {
    final id = InheritedWidgetDetailMovie.of(context)?.id;
    movieImage = apiImageMovie.getDetailImageData(id.toString());
    int? countImage = 0;
    return FutureBuilder<ImageMovie>(
      future: movieImage,
      builder: (context, snapshot) {
        if (snapshot.data?.backdrops?.length != null) {
          countImage = snapshot.data?.backdrops?.length;
          if (countImage! > 5) {
            countImage = 5;
          }
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('loi: ${snapshot.error.toString()}'),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: countImage,
              itemBuilder: (context, index) {
                return Image.network(
                  "$urlImage${snapshot.data?.backdrops?[index].filePath}",
                  fit: BoxFit.fill,
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
