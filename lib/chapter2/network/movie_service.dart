import 'dart:convert' as convert;

import 'package:flutter_intro_movie_app/chapter2/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

/// Register to imdb API (https://imdb-api.com/) and get an own apiKey for FREE.
const String apiKey = 'TODO';

Future<List<Movie>> fetchPopularMovies() async {
  final Response response = await http.get(
    Uri.parse('https://imdb-api.com/en/API/MostPopularMovies/$apiKey'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var data = convert.jsonDecode(response.body);

    // We use the List.from constructor to create
    // a new list of Movie objects from the transformed items
    List<Movie> movies =
        List<Movie>.from(data["items"].map((item) => Movie.fromJson(item)));
    return movies;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(
      'Failed to load movies, error code: ${response.statusCode}',
    );
  }
}
