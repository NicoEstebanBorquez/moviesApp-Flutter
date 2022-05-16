import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/custom_text_bold.dart';

import 'package:movies_app_flutter/movieDetails.dart';

class TopRatedMovies extends StatelessWidget {
  final List topratedMovies;

  const TopRatedMovies({Key? key, required this.topratedMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Const?---------------------------------------------------
            const custom_text_bold(
              text: 'Top Rated Movies',
              color: Colors.black,
              size: 18,
            ),
            const SizedBox(height: 10),
            Container(
              height: 250,
              child: ListView.builder(
                  itemCount: topratedMovies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetails(
                                        title: topratedMovies[index]['title'],
                                        overview: topratedMovies[index]
                                            ['overview'],
                                        release_date: topratedMovies[index]
                                            ['release_date'],
                                        poster_path:
                                            "https://image.tmdb.org/t/p/w500/" +
                                                topratedMovies[index]
                                                    ['poster_path'],
                                        backdrop_path:
                                            "https://image.tmdb.org/t/p/w500/" +
                                                topratedMovies[index]
                                                    ['backdrop_path'],
                                        vote_average: topratedMovies[index]
                                                ['vote_average']
                                            .toString(),
                                      )));
                        },
                        child: Container(
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                //POSTER ------------------------------
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w500/" +
                                                topratedMovies[index]
                                                    ['poster_path']))),
                              ),
                              Container(
                                  //MOVIE TITLE -------------------------
                                  child: custom_text_bold(
                                      text:
                                          topratedMovies[index]['title'] != null
                                              ? topratedMovies[index]['title']
                                              : custom_text_bold(
                                                  text: "Loading",
                                                  color: Colors.black,
                                                  size: 14),
                                      color: Colors.black,
                                      size: 14))
                            ],
                          ),
                        ));
                  }),
            )
          ],
        ));
  }
}
