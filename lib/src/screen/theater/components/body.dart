import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie/src/model/in_theater_model.dart';
import 'package:movie/src/model/upcoming_movie_model.dart';
import 'package:movie/src/network/api_service.dart';
import 'package:movie/src/network/api_upcoming_movie.dart';
import 'package:movie/src/screen/detail/detail_movie_screen.dart';

class Body extends StatefulWidget {
  
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late ApiService apiService;
  late ApiUpcominglMovie apiUpcoming;
  late Future<Movie> moviePlaying;
  late Future<UpcomingMovie> movieUpcoming;
  int selected = 0;
  late String urlImage;
  List<String> itemTabBarData = [
    "Top Lists",
    "Genres",
    "In Theaters",
    "Upcoming"
  ];
  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    moviePlaying = apiService.getMovieData();
    apiUpcoming = ApiUpcominglMovie();
    movieUpcoming = apiUpcoming.getUpcomingMovieData();
    urlImage = 'https://image.tmdb.org/t/p/w500';
  }

  int count = 0;
  bool isLoading = false;
  String? movieName;

  @override
  Widget build(BuildContext context) {
    late TabController _controller = TabController(length: 4, vsync: this);
    return Container(
      color: const Color.fromARGB(255, 176, 172, 172).withAlpha(200),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 7.0,
            sigmaY: 7.0,
          ),
          child: SafeArea(
              child: Container(
            color: Colors.black,
            child: Stack(children: [
              TabBarView(controller: _controller, children: [
                const Text(""),
                const Text(""),
                SizedBox(
                  width: double.infinity,
                  child: FutureBuilder<Movie>(
                      future: moviePlaying,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('loi: ${snapshot.error.toString()}'),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, right: 10),
                              child: GridView.builder(
                                itemCount: snapshot.data?.results?.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.7,
                                  mainAxisSpacing: 8.0,
                                  crossAxisSpacing: 4.0,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailMovieScreen(
                                                    id: snapshot.data
                                                        ?.results?[index].id,
                                                  )))
                                    },
                                    child: Image.network(
                                        '$urlImage${snapshot.data?.results?[index].posterPath}'),
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
                SizedBox(
                  width: double.infinity,
                  child: FutureBuilder<UpcomingMovie>(
                      future: movieUpcoming,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('loi: ${snapshot.error.toString()}'),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return Container(
                            padding: const EdgeInsets.only(top: 75),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: GridView.builder(
                                itemCount: snapshot.data?.results?.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.7,
                                  mainAxisSpacing: 8.0,
                                  crossAxisSpacing: 4.0,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailMovieScreen(
                                                    id: snapshot.data
                                                        ?.results?[index].id,
                                                  )))
                                    },
                                    child: Image.network(
                                        '$urlImage${snapshot.data?.results?[index].posterPath}'),
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
              Positioned(
                top: 25.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 50, 50, 50),
                  ),
                  child: TabBar(
                    controller: _controller,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(left: 18, right: 16),
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: const Color.fromARGB(255, 224, 51, 51),
                        borderRadius: BorderRadius.circular(10)),
                    unselectedLabelColor:
                        const Color.fromARGB(255, 239, 232, 232),
                    tabs: [
                      Tab(
                        text: itemTabBarData[0],
                      ),
                      Tab(
                        text: itemTabBarData[1],
                      ),
                      Tab(
                        text: itemTabBarData[2],
                      ),
                      Tab(
                        text: itemTabBarData[3],
                      ),
                    ],
                  ),
                ),
              )
            ]),
          )),
        ),
      ),
    );
  }
}
