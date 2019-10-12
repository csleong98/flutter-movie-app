import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  static String apiKey="75ccbdde3f5de947abb8ee34913e1efc";
  final String url="https://api.themoviedb.org/3/discover/movie?api_key=$apiKey";

  var movies;

  fetchMovies() async {
    var response = await http.get(url);
    var data = json.decode(response.body);

    setState(() {
      movies = data['results'];
    });
  }

@override
  void initState() {
    fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: isDark ? Brightness.dark:Brightness.light
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Movie App"),
          actions: <Widget>[
            Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                });
              },
            )
          ],
        ),
        body: movies == null
            ? Center(child: CircularProgressIndicator(),
            )
            : RefreshIndicator(
                onRefresh: _refreshController,
                child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, i) {
                    return Text("I'm data");
                  },
                ),
            ),
      ),
    );
  }
  Future<void> _refreshController() async {
    setState(() {
      movies = null;
    });

    fetchMovies();
  }
}