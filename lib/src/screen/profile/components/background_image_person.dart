import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie/src/screen/profile/components/body_profile.dart';
import 'package:movie/src/screen/profile/profile_screen.dart';

class BackgroundPerson extends StatefulWidget {
  const BackgroundPerson({Key? key}) : super(key: key);

  @override
  State<BackgroundPerson> createState() => _BackgroundPersonState();
}

class _BackgroundPersonState extends State<BackgroundPerson> {
  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedWidgetProfileMovie.of(context)?.snapshot;
    const urlImage = 'https://image.tmdb.org/t/p/original';
    return Stack(
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 20),
              child: Image.network(
                '$urlImage${snapshot?.data?.profilePath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Positioned.fill(
          top: 70,
          child: BodyProfileMovie(),
        )
      ],
    );
  }
}
