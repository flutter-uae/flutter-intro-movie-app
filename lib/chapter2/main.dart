import 'package:flutter/material.dart';
import 'package:flutter_intro_movie_app/chapter1/main.dart';
import 'package:flutter_intro_movie_app/chapter2/model/movie.dart';
import 'package:flutter_intro_movie_app/chapter2/network/movie_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MovieScreen(title: "Most Popular Movies"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key, required this.title});

  final String title;

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late Future<List<Movie>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: FutureBuilder<List<Movie>>(
            future: futureMovies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movies = snapshot.data;
                return ListView.builder(
                  itemCount: movies?.length,
                  itemBuilder: (context, index) {
                    final movie = movies![index];
                    return ListTile(
                      leading: Image.network(movie.image),
                      title: Text('${movie.title} (${movie.year})'),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          Text(movie.rating),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class _BadList extends StatelessWidget {
  const _BadList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ...Iterable.generate(999, (index) {
            return MovieListItem(
              image:
                  'https://m.media-amazon.com/images/M/MV5BMDExZGMyOTMtMDgyYi00NGIwLWJhMTEtOTdkZGFjNmZiMTEwXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_Ratio0.6716_AL_.jpg',
              title: 'Movie title',
              rating: '$index',
            );
          }),
        ],
      ),
    );
  }
}

class _BetterList extends StatelessWidget {
  const _BetterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ...Iterable.generate(1000, (index) {
          return MovieListItem(
            image:
                'https://m.media-amazon.com/images/M/MV5BMDExZGMyOTMtMDgyYi00NGIwLWJhMTEtOTdkZGFjNmZiMTEwXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_Ratio0.6716_AL_.jpg',
            title: 'Movie title2',
            rating: '$index',
          );
        }),
      ],
    );
  }
}

class _GoodList extends StatelessWidget {
  const _GoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return MovieListItem(
          image:
              'https://m.media-amazon.com/images/M/MV5BMDExZGMyOTMtMDgyYi00NGIwLWJhMTEtOTdkZGFjNmZiMTEwXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_Ratio0.6716_AL_.jpg',
          title: 'Movie title',
          rating: '$index',
        );
      },
    );
  }
}
