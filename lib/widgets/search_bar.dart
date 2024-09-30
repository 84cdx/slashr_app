import 'package:flutter/material.dart';
import 'package:media_recommendation_app/api/api.dart';
import 'package:media_recommendation_app/models/movie.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  List<Movie> _movies = [];
  bool _isLoading = false;

  void _searchMovies(String query) async {
    setState(() {
      _isLoading = true;
    });

    if (query.isNotEmpty) {
      final movies = await Api().searchHorrorMovies(query);
      setState(() {
        _movies = movies;
        _isLoading = false;
      });
    } else {
      setState(() {
        _movies = [];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) => _searchMovies(value),
          decoration: InputDecoration(
            hintText: 'Search horror movies...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        _isLoading
            ? CircularProgressIndicator()
            : Expanded(
                child: ListView.builder(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    final movie = _movies[index];
                    return ListTile(
                      title: Text(movie.title),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
