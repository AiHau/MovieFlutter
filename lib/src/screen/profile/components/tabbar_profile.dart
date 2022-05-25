import 'package:flutter/material.dart';
import 'package:movie/src/model/movies_person_model.dart';
import 'package:movie/src/network/api_movie_person.dart';
import 'package:movie/src/screen/detail/components/list_credit_movie.dart';
import 'package:movie/src/screen/profile/profile_screen.dart';

class TabbarProfile extends StatefulWidget {
  final int? id;
  const TabbarProfile({Key? key, this.id}) : super(key: key);

  @override
  State<TabbarProfile> createState() => _TabbarProfileState();
}

class _TabbarProfileState extends State<TabbarProfile>
    with TickerProviderStateMixin {
  late Future<MoviePerson> moviePerson;
  late ApiMoviePerson apiMoviePerson;
  late String urlImage;
  @override
  void initState() {
    super.initState();
    apiMoviePerson = ApiMoviePerson();
    moviePerson = apiMoviePerson.getMoviePersonData(widget.id.toString());
    urlImage = 'https://image.tmdb.org/t/p/original';
  }

  @override
  Widget build(BuildContext context) {
    final snapshot = InheritedWidgetProfileMovie.of(context)?.snapshot;
    TabController _controller = TabController(length: 2, vsync: this);
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.only(
                  left: 100, right: 100, top: 5, bottom: 5),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 50, 50, 50),
              ),
              child: TabBar(
                controller: _controller,
                isScrollable: true,
                labelPadding: const EdgeInsets.only(left: 18, right: 22),
                labelColor: Colors.white,
                indicator: BoxDecoration(
                    color: const Color.fromARGB(255, 135, 133, 133),
                    borderRadius: BorderRadius.circular(10)),
                unselectedLabelColor: const Color.fromARGB(255, 239, 232, 232),
                tabs: const [
                  Tab(
                    text: "Biography",
                  ),
                  Tab(
                    text: "Movies",
                  ),
                ],
              ),
            ),
          ),
        ),
        // const TabbarView(),
        Container(
          color: const Color.fromARGB(255, 23, 22, 22),
          padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
          height: 350,
          child: TabBarView(controller: _controller, children: [
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '${snapshot?.data?.biography}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FutureBuilder<MoviePerson>(
                  future: moviePerson,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('loi: ${snapshot.error.toString()}'),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      List<Cast>? listCast = snapshot.data?.cast;
                      List<Cast>? listCrew = snapshot.data?.crew;
                      if (listCast!.isEmpty && listCrew!.isEmpty) {
                        return const Text("Unvailable");
                      } else if (listCast.isEmpty) {
                        return ShowListMoviePerson(
                          listCredit: listCrew!,
                        );
                      } else if (listCrew!.isEmpty) {
                        return ShowListMoviePerson(listCredit: listCast);
                      } else {
                        for (int i = 0; i < listCrew.length; i++) {
                          for (int j = 1; j < listCast.length; j++) {
                            if (listCrew[i].id == listCast[j].id) {
                              listCast.remove(listCast[j]);
                            }
                          }
                        }
                      }
                      return ShowListMoviePerson(
                          listCredit: listCrew + listCast);
                    } else {
                      return const Text(' ');
                    }
                  }),
            ),
          ]),
        )
      ],
    );
  }

  String getYearMovie(String s) {
    var year = s.split('-');
    return year[0];
  }
}
