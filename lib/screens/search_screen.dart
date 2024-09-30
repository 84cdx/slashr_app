import 'package:flutter/material.dart';
import 'package:media_recommendation_app/api/api.dart';
import 'package:media_recommendation_app/models/movie.dart';
import 'package:media_recommendation_app/widgets/movie_item.dart';

class SearchScreen extends StatelessWidget {
  final String query;

  const SearchScreen({super.key, required this.query});

  Future<List<Movie>> _fetchSearchResults() async {
    try {
      final results = await Api().searchHorrorMovies(query);
      print('Search results: $results');
      return results;
    } catch (e) {
      throw Exception('Failed to fetch search results: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results for "${Uri.decodeComponent(query)}"'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<List<Movie>>(
        future: _fetchSearchResults(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return MovieItem(movie: snapshot.data![index]);
              },
            );
          } else {
            return const Center(
                child: Text(
                    'No results found.'));
          }
        },
      ),
    );
  }
}
