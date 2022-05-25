import 'package:flutter/material.dart';
import 'package:movie/src/model/movies_person_model.dart';
import 'package:movie/src/network/api_movie_person.dart';
import 'package:movie/src/screen/detail/detail_movie_screen.dart';
import 'package:movie/src/screen/profile/profile_screen.dart';

class TabbarView extends StatefulWidget {
  final int? id;
  const TabbarView({Key? key, this.id}) : super(key: key);

  @override
  State<TabbarView> createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> with TickerProviderStateMixin {
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
    TabController _controller = TabController(length: 2, vsync: this);
    final snapshot = InheritedWidgetProfileMovie.of(context)?.snapshot;
    return Container(
      color: const Color.fromARGB(255, 36, 35, 35),
      padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
      height: 418.9,
      child: TabBarView(controller: _controller, children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            '${snapshot?.data?.biography}',
            style: const TextStyle(color: Colors.white),
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
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    padding: const EdgeInsets.only(top: 75),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: ListView.builder(
                        itemCount: snapshot.data?.cast?.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailMovieScreen(
                                            id: snapshot.data?.cast?[index].id,
                                          )))
                            },
                            child: Image.network(
                                '$urlImage${snapshot.data?.cast?[index].posterPath}'),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const Text(' ');
                }
              }),
        ),
      ]),
    );
  }
}
