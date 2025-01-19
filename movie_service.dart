import 'package:groupassignment/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieService{
  final String? apiKey = 'TMDB_API_KEY';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse('baseUrl/movie/popular?apiJey'));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final List<dynamic> results = decodedData['results'];
      return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
    
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
