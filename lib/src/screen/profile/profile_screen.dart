import 'package:flutter/material.dart';
import 'package:movie/src/model/profile_model.dart';
import 'package:movie/src/network/api_profile.dart';
import 'package:movie/src/screen/profile/components/background_image_person.dart';
import 'package:movie/src/screen/profile/components/tabbar_profile.dart';
import 'package:movie/src/screen/profile/components/appbar_widget.dart';

class ProfileScreen extends StatefulWidget {
  final int? id;

  const ProfileScreen({Key? key, this.id}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<ProfileMovie> movieProfile;
  late ApiProfileMovie apiProfileMovie;
  late String urlImage;
  @override
  void initState() {
    super.initState();
    apiProfileMovie = ApiProfileMovie();
    movieProfile = apiProfileMovie.getDetailProfileData(widget.id.toString());
    urlImage = 'https://image.tmdb.org/t/p/original';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder<ProfileMovie>(
            future: movieProfile,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('loi: ${snapshot.error.toString()}'),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return InheritedWidgetProfileMovie(snapshot, widget.id,
                    child: Column(
                      children: [
                        Stack(
                          children: const [
                            BackgroundPerson(),
                            Positioned(child: AppBarMovieDetail()),
                          ],
                        ),
                        TabbarProfile(id: snapshot.data?.id),
                        // TabbarView(),
                      ],
                    )
                    // const BackgroundPerson(),
                    );
              } else {
                return const Text("");
              }
            }),
      ),
    );
  }
}

class InheritedWidgetProfileMovie extends InheritedWidget {
  // ignore: use_key_in_widget_constructors
  const InheritedWidgetProfileMovie(this.snapshot, this.id,
      {required Widget child})
      : super(child: child);
  final AsyncSnapshot<ProfileMovie>? snapshot;
  final int? id;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static InheritedWidgetProfileMovie? of(BuildContext context) {
    // 5
    return context
        .dependOnInheritedWidgetOfExactType<InheritedWidgetProfileMovie>();
  }
}
