import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MoviesScreen(title: "Most Popular Movies"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                MoviesListItem(
                  // image: 'https://m.media-amazon.com/images/M/MV5BMDExZGMyOTMtMDgyYi00NGIwLWJhMTEtOTdkZGFjNmZiMTEwXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_Ratio0.6716_AL_.jpg',
                  title: 'Movie title',
                  rating: '9.9',
                ),
                MoviesListItem(
                  title: 'Movie title',
                  rating: '9.6',
                ),
                MoviesListItem(
                  title: 'Movie title',
                  rating: '9.3',
                ),
                MoviesListItem(
                  title: 'Movie title',
                  rating: '9.2',
                ),
                MoviesListItem(
                  title: 'Movie title',
                  rating: '9.1',
                ),
                MoviesListItem(
                  title: 'Movie title',
                  rating: '9.1',
                ),
                MoviesListItem(
                  title: 'Movie title',
                  rating: '9.1',
                ),
                MoviesListItem(
                  title: 'Movie title',
                  rating: '9.1',
                ),
                MoviesListItem(
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

class MoviesListItem extends StatelessWidget {
  const MoviesListItem({
    Key? key,
    this.image,
    required this.title,
    required this.rating,
  }) : super(key: key);

  final String title;
  final String rating;
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
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
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
