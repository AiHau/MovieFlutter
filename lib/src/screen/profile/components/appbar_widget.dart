import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie/src/screen/profile/profile_screen.dart';

class AppBarMovieDetail extends StatefulWidget {
  const AppBarMovieDetail({Key? key}) : super(key: key);

  @override
  State<AppBarMovieDetail> createState() => _AppBarMovieDetailState();
}

class _AppBarMovieDetailState extends State<AppBarMovieDetail> {
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedWidgetProfileMovie.of(context)?.snapshot;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              color: Colors.black54,
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.red,
                          ),
                          Text(
                            'Back',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      margin: const EdgeInsets.only(left: 60),
                      child: Text(
                        '${snapshot?.data?.name}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
