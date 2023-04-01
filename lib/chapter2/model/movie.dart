class Movie {
  String id;
  String title;
  String year;
  String rating;
  String image;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.image,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      rating: json['imDbRating'],
      image: json['image'],
    );
  }
}
