import 'package:homepage/movie.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieService{
  final String? apiKey = dotenv.env['TMDB_API_KEY']; 
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