import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/custom_text_bold.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'widgets/upcoming.dart';
import 'widgets/toprated.dart';
import 'widgets/popular.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            //backgroundColor: Colors.red,
            primaryColor: Colors.amber)
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Lists of movies
  List trendingMoviesList = [];
  List upcomingMoviesList = [];
  List popularMoviesList = [];
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
    Map upcomingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map popularResult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    //Updating state
    setState(() {
      trendingMoviesList = trendingResult['results'];
      upcomingMoviesList = upcomingResult['results'];
      popularMoviesList = popularResult['results'];
      topRatedMoviesList = topRatedResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
          //backgroundColor: Colors.transparent,
          backgroundColor: Colors.black87,
          elevation: 15,
          title: const custom_text_bold(text: 'MoviesApp', color: Colors.white, size: 24,)

      ),
      body: ListView(children: [
        UpcomingMovies(upcomingMovies: upcomingMoviesList),
        PopularMovies(popularMovies: popularMoviesList),
        TopRatedMovies(topratedMovies: topRatedMoviesList)
      ]),
    );
  }
}
