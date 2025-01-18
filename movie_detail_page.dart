import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Import rating bar
import 'movie.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie?;

    if (movie == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("Movie data not found")),
      );
    }

    final posterUrl = 'https://image.tmdb.org/t/p/w500${movie.posterpath}';

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: movie.id,
                child: CachedNetworkImage(
                  imageUrl: posterUrl,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              movie.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                RatingBarIndicator(
                  rating: movie.rating / 2,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  unratedColor: Colors.grey,
                ),
                const SizedBox(width: 8),
                Text('(${movie.rating})'),
              ],
            ),
            const SizedBox(height: 8),
            Text('Release Date: ${movie.releaseDate}'),
            const SizedBox(height: 8),
            Text('Duration: ${movie.duration} minutes'),
            const SizedBox(height: 8),
            Text(
              movie.overview,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}