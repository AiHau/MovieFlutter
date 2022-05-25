import 'package:flutter/material.dart';
import 'package:movie/routs.dart';
import 'package:movie/src/screen/theater/intheater_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Movie app',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        canvasColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
      ),
      //home: InTheaterScreen(),
      initialRoute: InTheaterScreen.routeName,
      routes: routes,
    );
  }
}
