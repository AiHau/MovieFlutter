import 'package:flutter/material.dart';
import 'package:movie/common/age_person.dart';
import 'package:movie/src/screen/profile/profile_screen.dart';

class BodyProfileMovie extends StatefulWidget {
  const BodyProfileMovie({Key? key}) : super(key: key);

  @override
  State<BodyProfileMovie> createState() => _BodyProfileMovieState();
}

class _BodyProfileMovieState extends State<BodyProfileMovie> {
  @override
  Widget build(BuildContext context) {
    const urlImage = 'https://image.tmdb.org/t/p/original';
    final snapshot = InheritedWidgetProfileMovie.of(context)?.snapshot;
    var image = snapshot?.data?.profilePath;
    if (image == null) {
      image =
          'https://anhdep123.com/wp-content/uploads/2021/05/hinh-avatar-trang.jpg';
    } else {
      image = '$urlImage$image';
    }
    return Column(
      children: [
        ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(50),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 7),
          child: Text(
            getOld(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            '${snapshot?.data?.placeOfBirth}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: const Text(
            '12 Movies',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  String getOld() {
    final snapshot = InheritedWidgetProfileMovie.of(context)?.snapshot;
    if (snapshot?.data?.birthday != null) {
      final yearOfBirth = snapshot?.data?.birthday?.split('-')[0];
      return ((CurrentYear.getCurrentYear()) - int.parse(yearOfBirth!))
              .toString() +
          ' Years old';
    }
    return "Unknown";
  }
}
