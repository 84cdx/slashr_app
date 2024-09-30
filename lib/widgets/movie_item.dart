import 'package:flutter/material.dart';
import 'package:media_recommendation_app/models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://image.tmdb.org/t/p/w92${movie.posterPath}',
        fit: BoxFit.cover,
      ),
      title: Text(movie.title),
      onTap: () {},
    );
  }
}
