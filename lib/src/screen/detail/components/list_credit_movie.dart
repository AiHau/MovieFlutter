import 'package:flutter/material.dart';

class ShowListMoviePerson extends StatefulWidget {
  final List listCredit;
  const ShowListMoviePerson({
    Key? key,
    required this.listCredit,
  }) : super(key: key);

  @override
  State<ShowListMoviePerson> createState() => _ShowListMoviePersonState();
}

class _ShowListMoviePersonState extends State<ShowListMoviePerson> {
  @override
  Widget build(BuildContext context) {
    const urlImage = 'https://image.tmdb.org/t/p/original';
    return ListView.builder(
      itemCount: widget.listCredit.length,
      itemBuilder: (context, index) {
        String? image = widget.listCredit[index].posterPath;
        if (image == null) {
          image =
              'https://1.bp.blogspot.com/-Al0uKuyGnYU/V0gJX5ULmGI/AAAAAAAADHw/Mqe3WxnvBqEzHuq_E_M4yzuhid_PoxnBgCLcB/s1600/img.gif';
        } else {
          image = '$urlImage$image';
        }
        return Container(
          height: 80,
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
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.listCredit[index].originalTitle}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        getYearMovie("${widget.listCredit[index].releaseDate}"),
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  String getYearMovie(String s) {
    var year = s.split('-');
    return year[0];
  }
}
