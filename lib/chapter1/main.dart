import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// The top-level widget of the application.
@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MovieListScreen(title: "Most Popular Movies"),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// The screen that displays a list of movies.
@immutable
class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key, required this.title});

  /// The title to display in the app bar.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                MovieListItem(
                  image:
                      'https://m.media-amazon.com/images/M/MV5BMDExZGMyOTMtMDgyYi00NGIwLWJhMTEtOTdkZGFjNmZiMTEwXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_Ratio0.6716_AL_.jpg',
                  title: 'Movie title',
                  rating: '9.9',
                ),
                MovieListItem(
                  title: 'Movie title',
                  rating: '9.6',
                ),
                MovieListItem(
                  title: 'Movie title',
                  rating: '9.3',
                ),
                MovieListItem(
                  title: 'Movie title',
                  rating: '9.2',
                ),
                MovieListItem(
                  title: 'Movie title',
                  rating: '9.1',
                ),
                MovieListItem(
                  title: 'Movie title',
                  rating: '9.1',
                ),
                MovieListItem(
                  title: 'Movie title',
                  rating: '9.1',
                ),
                MovieListItem(
                  title: 'Movie title',
                  rating: '9.1',
                ),
                MovieListItem(
                  title: 'Movie title',
                  rating: '9.1',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A single item in the movies list.
@immutable
class MovieListItem extends StatelessWidget {
  const MovieListItem({
    Key? key,
    this.image,
    required this.title,
    required this.rating,
  }) : super(key: key);

  /// The title of the movie.
  final String title;

  /// The rating of the movie.
  final String rating;

  /// The URL of the movie's image, or null if no image is available.
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          if (image != null && image!.isNotEmpty)
            Image.network(image!, height: 52)
          else
            const Icon(Icons.movie, size: 52),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16)),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  Text(rating),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
