import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trendingMovies;

  const TrendingMovies({Key? key, required this.trendingMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Const?---------------------------------------------------
            const modified_text(
              text: 'Popular Movies',
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(height: 10),
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: trendingMovies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {},
                        child: Container(
                          width: 140,
                          child: Column(
                            children: [
                              Container( //POSTER ------------------------------
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w300/" +
                                                trendingMovies[index]
                                                    ['poster_path']))),
                              ),
                              Container( //MOVIE TITLE -------------------------
                                  child: modified_text(
                                      text: trendingMovies[index]['title'] != null
                                              ? trendingMovies[index]['title']
                                              : modified_text(
                                                  text: "Loading",
                                                  color: Colors.white,
                                                  size: 14),
                                      color: Colors.white,
                                      size: 14)
                              )
                            ],
                          ),
                        ));
                  }),
            )
          ],
        )
    );
  }
}
