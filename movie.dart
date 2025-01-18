class Movie{
  final int id;
  final String title;
  final String posterpath;
  final String overview;
  final double rating;
  final String releaseDate;
  final int duration;

  Movie({
  required this.id,
  required this.title,
  required this.posterpath,
  required this.overview,
  required this.rating,
  required this.releaseDate,
  required this.duration,
});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      id: json['id'],
      title: json['title'],
      posterpath: json['poster_path'] ?? '',
      overview: json['overview'] ?? '',
      rating: (json['vote_average']as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      duration: json['runtime'] ?? 0,
    );
  }
}