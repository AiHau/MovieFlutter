import 'package:flutter/material.dart';
import 'package:movie/src/model/detail_movie_model.dart';
import 'package:movie/src/screen/detail/detail_movie_screen.dart';
import 'package:movie/src/screen/profile/profile_screen.dart';

class DirectorDetaMovie extends StatefulWidget {
  const DirectorDetaMovie({Key? key}) : super(key: key);

  @override
  State<DirectorDetaMovie> createState() => _DirectorDetaMovieState();
}

class _DirectorDetaMovieState extends State<DirectorDetaMovie> {
  final urlImage = 'https://image.tmdb.org/t/p/w45';
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Director",
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
      SizedBox(
          height: 60,
          child: Container(
            margin: const EdgeInsets.only(bottom: 0),
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
                              id: getDirector()?.id,
                            )))
              },
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(getImageAvataerDirector()),
                  ),
                  // ClipOval(
                  //   child: SizedBox.fromSize(
                  //     size: Size.fromRadius(20),
                  //     child: Image.network(
                  //       getImageAvataerDirector(),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      getDirector()?.name ?? '',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ))
    ]);
  }

  Crew? getDirector() {
    final snapshot = InheritedWidgetDetailMovie.of(context)?.snapshot;
    final listCrew = snapshot?.data?.credits?.crew;
    if (listCrew != null) {
      for (int i = 0; i < listCrew.length; i++) {
        if (listCrew[i].job?.compareTo('Director') == 0) {
          return listCrew[i];
        }
      }
    }
    return null;
  }

  String getImageAvataerDirector() {
    if (getDirector()?.profilePath != null) {
      return '$urlImage${getDirector()?.profilePath}';
    }
    return 'https://anhdep123.com/wp-content/uploads/2021/05/hinh-avatar-trang.jpg';
  }
}
