import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie/src/screen/theater/components/body.dart';

const url =
    "https://api.themoviedb.org/3/movie/12?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=videos";

class InTheaterScreen extends StatefulWidget {
  static String routeName = "/in_theater";

  const InTheaterScreen({Key? key}) : super(key: key);

  @override
  State<InTheaterScreen> createState() => _InTheaterScreenState();
}

class _InTheaterScreenState extends State<InTheaterScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Body(),
      bottomNavigationBar: SizedBox(
          height: 80,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7.0,
                sigmaY: 7.0,
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor:
                    Color.fromARGB(255, 103, 101, 101).withAlpha(200),
                iconSize: 30,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.star),
                    label: "Discover",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: "My Lists",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.newspaper_outlined),
                    label: "News",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "Setting",
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                fixedColor: Colors.red,
              ),
            ),
          )),
    );
  }
}
