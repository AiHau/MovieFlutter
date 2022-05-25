import 'package:flutter/material.dart';

class RateDetailMovie extends StatefulWidget {
  const RateDetailMovie({Key? key}) : super(key: key);

  @override
  State<RateDetailMovie> createState() => _RateDetailMovieState();
}

class _RateDetailMovieState extends State<RateDetailMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Rating",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: const Text(
              "Rate this movie",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 3),
                child: const InkWell(
                  child: Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 177, 117, 12),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 3),
                child: const InkWell(
                  child: Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 177, 117, 12),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 3),
                child: const InkWell(
                  child: Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 177, 117, 12),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 3),
                child: const InkWell(
                  child: Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 177, 117, 12),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 3),
                child: const InkWell(
                  child: Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 177, 117, 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
