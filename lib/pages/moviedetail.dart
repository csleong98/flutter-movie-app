import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final movie;

  MovieDetail({@required this.movie});

  @override
  Widget build(BuildContext context) {
    String imageUrl = "http://image.tmdb.org/t/p/w500/";

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: movie['poster_path'],
              child: Container(
                height: 500.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl + movie['poster_path']),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              movie['title'],
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  decoration: TextDecoration.underline),
            ),

            SizedBox(
              height: 8.0,
            ),
            Text(
              movie['overview'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
                fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
      )),
    );
  }
}
