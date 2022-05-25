import 'package:flutter/material.dart';
import 'package:movie/src/screen/detail/detail_movie_screen.dart';
import 'package:movie/src/screen/profile/profile_screen.dart';

class CastDetailMovie extends StatefulWidget {
  const CastDetailMovie({Key? key}) : super(key: key);

  @override
  State<CastDetailMovie> createState() => _CastDetailMovieState();
}

class _CastDetailMovieState extends State<CastDetailMovie> {
  final urlImage = 'https://image.tmdb.org/t/p/w45';
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedWidgetDetailMovie.of(context)?.snapshot;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cast",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: snapshot?.data?.credits?.cast?.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (context, index) {
              var image = snapshot?.data?.credits?.cast?[index].profilePath;
              if (image == null) {
                image =
                    'https://anhdep123.com/wp-content/uploads/2021/05/hinh-avatar-trang.jpg';
              } else {
                image = '$urlImage$image';
              }
              return Container(
                // margin: EdgeInsets.only(bottom: 0),
                // height: 100,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 23, 22, 22),
                    border: Border(
                      top: BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 36, 35, 35)),
                      bottom: BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 36, 35, 35)),
                    )),
                padding: const EdgeInsets.only(left: 10, right: 8),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                                  id: snapshot?.data?.credits?.cast?[index].id,
                                )))
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(20),
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Text(
                          "${snapshot?.data?.credits?.cast?[index].name}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
