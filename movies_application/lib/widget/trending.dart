// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movies_application/description.dart';

class TrendingPage extends StatelessWidget {
  final List trending;
  const TrendingPage({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            "Trending Movies",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: trending[index]['title'],
                                  description: trending[index]['overview'],
                                  banner_url:
                                      "https://image.tmdb.org/t/p/w500" +
                                          trending[index]['backdrop_path'],
                                  poster_url:
                                      "https://image.tmdb.org/t/p/w500" +
                                          trending[index]['poster_path'],
                                  vote: trending[index]['vote_average'].toString(),
                                  launch_date: trending[index]
                                      ['release_date'])));
                    },
                    child: SizedBox(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500${trending[index]['poster_path']}"))),
                          ),
                          Text(
                            trending[index]['title'] ?? "Loading",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
