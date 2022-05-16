import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieDetails extends StatelessWidget {
  final String title;
  final String overview;
  final String backdrop_path;
  final String poster_path;
  final String vote_average;
  final String release_date;

  const MovieDetails(
      {Key? key,
      required this.title,
      required this.overview,
      required this.backdrop_path,
      required this.poster_path,
      required this.vote_average,
      required this.release_date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: ListView(children: [
        Container(
          height: 250,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network(backdrop_path, fit: BoxFit.cover),
              )),
              /*Positioned(
                  bottom: 10,
                  child: modified_text(
                    text: 'Rating: ' + vote,
                    color: Colors.black,
                    size: 12,
                  )),*/
              Container(
                padding: EdgeInsets.only(left: 10),
                /*child: modified_text(
                      text: "Released:" + launch_on,
                      color: Colors.black,
                      size: 12)*/
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
            padding: EdgeInsets.all(10),
            child: modified_text(
              text: title,
              color: Colors.black,
              size: 26,
            )),
        Row(
          children: [
            Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(poster_path)),
            Flexible(
              child: Container(
                child: modified_text(
                  text: overview,
                  color: Colors.black,
                  size: 16,
                ),
              ),
            ),
          ],
        )
      ])),
    );
  }
}
