// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Toprated extends StatelessWidget {
  final List topRated;
  const Toprated({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Rated Movies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 170,

            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500${topRated[index]['backdrop_path']}"))),
                          ),
                          Text(topRated[index]['title'] ?? "Loading",style: TextStyle(color: Colors.white)),
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
