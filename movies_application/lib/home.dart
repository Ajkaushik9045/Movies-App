import 'package:flutter/material.dart';
import 'package:movies_application/widget/toprated.dart';
import 'package:movies_application/widget/trending.dart';
import 'package:movies_application/widget/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvShows = [];
  final acesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MmUzOGQ4MTZjZWZiZGE0MzE4Y2JiNGE4NTQ5YzZhYyIsIm5iZiI6MTcyNjE0Njc5Mi4yODA0ODQsInN1YiI6IjY2ZGVmODFlOTdmNmVkZDkzNzA0NjZjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C64n9lZqjVqFxeNOLnBezKh37oqvWS8BgqFf0JbL9s8";
  final String _url = "https://api.themoviedb.org/3/movie/popular?";
  final String _api_key = "42e38d816cefbda4318cbb4a8549c6ac";

  @override
  void initState() {
    loadMore();
    super.initState();
  }

  loadMore() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(_api_key, acesstoken),
        logConfig: const ConfigLogger(
          showErrorLogs: true,
          showLogs: true,
        ));

    Map tmdbTrendingData = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedData = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsData = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = tmdbTrendingData['results'];
      topRatedMovies = topRatedData['results'];
      tvShows = tvShowsData['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("TMDB Movie App",style: TextStyle(fontWeight: FontWeight.bold),),backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                TrendingPage(trending: trendingMovies),
                Toprated(topRated: topRatedMovies),
                TvShow(tvShow: tvShows,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
