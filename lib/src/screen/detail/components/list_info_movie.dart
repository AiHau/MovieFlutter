import 'package:flutter/material.dart';
import 'package:movie/src/screen/detail/detail_movie_screen.dart';

class ListInformationMovie extends StatefulWidget {
  const ListInformationMovie({Key? key}) : super(key: key);

  @override
  State<ListInformationMovie> createState() => _ListInformationMovieState();
}

class _ListInformationMovieState extends State<ListInformationMovie> {
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedWidgetDetailMovie.of(context)?.snapshot;
    return Column(
      children: [
        Container(
          height: 50,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 23, 22, 22),
              border: Border(
                top: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 36, 35, 35)),
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 36, 35, 35)),
              )),
          padding: const EdgeInsets.only(left: 10, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Release Date",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.only(left: 160),
                child: Text(
                  '${snapshot?.data?.releaseDate.toString()}',
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              const InkWell(
                child: Icon(Icons.flag,
                    color: Color.fromARGB(255, 180, 38, 38), size: 22),
              )
            ],
          ),
        ),
        Container(
          height: 50,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 23, 22, 22),
              border: Border(
                top: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 36, 35, 35)),
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 36, 35, 35)),
              )),
          padding: const EdgeInsets.only(left: 10, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Runtime",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.only(left: 248),
                child: Text(
                  '${snapshot?.data?.runtime?.toString()}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const Text(' min',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
        Container(
          height: 50,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 23, 22, 22),
              border: Border(
                top: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 36, 35, 35)),
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 36, 35, 35)),
              )),
          padding: const EdgeInsets.only(left: 10, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Rating",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                "Not Available",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          height: 50,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 23, 22, 22),
              border: Border(
                top: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 36, 35, 35)),
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 36, 35, 35)),
              )),
          padding: const EdgeInsets.only(left: 10, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Genre",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Row(
                children: [
                  ...List.generate(
                    snapshot?.data?.genres?.length ?? 4,
                    (index) => Text(
                      "${snapshot?.data?.genres?[index].name}"
                      ",",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
