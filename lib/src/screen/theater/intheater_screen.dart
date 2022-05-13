import 'package:flutter/material.dart';
import 'package:movie/src/model/in_theater_model.dart';
import 'package:movie/src/network/api_service.dart';
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
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 80, 79, 79),
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
    );
  }
}
