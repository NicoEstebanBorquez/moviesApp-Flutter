import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'widgets/trending.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.amber));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Lists of movies
  List trendingMoviesList = [];
  List topRatedMoviesList = [];

  //API KEY
  final String API_KEY = '572f6e73385919e6eb3a365a3e144cce';
  final String READ_ACCESS_TOKEN =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NzJmNmU3MzM4NTkxOWU2ZWIzYTM2NWEzZTE0NGNjZSIsInN1YiI6IjYxZDc2MWFhZDQ4Y2VlMDA4YmU0ZDJmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Y9e4P70XmkO_FAPsDm_hA1yAAwITuRagyWIxbq75DLs';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(API_KEY, READ_ACCESS_TOKEN),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    //We get a Map from the API, not a List
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    //Updating state
    setState(() {
      trendingMoviesList = trendingResult['results'];
      topRatedMoviesList = topRatedResult['results'];
    });
    //print(trendingMoviesList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const modified_text(
            text: 'MoviesApp',
            color: Colors.white,
            size: 20,
          )),
      body: ListView(
        children: [
          TrendingMovies(trendingMovies: trendingMoviesList)

        ]
      ),
    );
  }
}
