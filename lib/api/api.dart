import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:media_recommendation_app/constants.dart';
import 'package:media_recommendation_app/models/movie.dart';

class Api {
  static const _trendingUrl =
      '${Constants.baseUrl}trending/movie/week?api_key=${Constants.apiKey}';

  static const _topRatedUrl =
      '${Constants.baseUrl}movie/top_rated?api_key=${Constants.apiKey}';

  static const _upcomingUrl =
      '${Constants.baseUrl}movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<Movie>> fetchHorrorMovies() async {
    final response = await http.get(
      Uri.parse(
        '${Constants.baseUrl}discover/movie?api_key=${Constants.apiKey}&with_genres=27&page=1',
      ),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      List movies = jsonResponse['results'];
      return movies.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> searchHorrorMovies(String query) async {
    if (query.isEmpty) {
      return [];
    }

    try {
      final response = await http.get(
        Uri.parse(
          '${Constants.baseUrl}search/movie?api_key=${Constants.apiKey}&query=$query&page=1',
        ),
      );

      // Verarbeite die Antwort, um sicherzustellen, dass sie keine Fehler verursacht
      return _processResponse(response);
    } catch (e) {
      print('Error occurred while searching: $e'); // Debugging
      return [];
    }
  }

  Future<List<Movie>> _processResponse(http.Response response) async {
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      List movies = jsonResponse['results'];

      // Verwende contains, um eine breitere Übereinstimmung zu erzielen
      List<Movie> matchingMovies = movies
          .map((movie) => Movie.fromJson(movie))
          .where((movie) =>
              movie.genreIds.contains(27)) // Filtern nach Genre Horror
          .toList();

      // Wenn keine Horrorfilme gefunden werden, gib einfach die leere Liste zurück
      return matchingMovies
          .take(5)
          .toList(); // Rückgabe der obersten 5 Horrorfilme oder weniger
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData
          .map((movie) => Movie.fromJson(movie))
          .where((movie) => movie.genreIds.contains(27))
          .toList();
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<List<Movie>> getTopRatedMovies(int totalPages) async {
    List<Movie> allTopRatedMovies = [];

    for (int i = 1; i <= totalPages; i++) {
      final response = await http.get(Uri.parse('$_topRatedUrl&page=$i'));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        allTopRatedMovies
            .addAll(decodedData.map((movie) => Movie.fromJson(movie)));
      } else {
        throw Exception('something went wrong');
      }
    }

    // Filtere die Horrorfilme
    return allTopRatedMovies
        .where((movie) => movie.genreIds.contains(27))
        .toList();
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      List<Movie> upcomingMovies =
          decodedData.map((movie) => Movie.fromJson(movie)).toList();

      // Filtere nur Filme mit Release-Datum in der Zukunft und Genre-ID 27
      upcomingMovies = upcomingMovies.where((movie) {
        DateTime releaseDate = DateTime.parse(movie.releaseDate);
        return releaseDate.isAfter(DateTime.now()) &&
            movie.genreIds.contains(27);
      }).toList();

      return upcomingMovies;
    } else {
      throw Exception('something went wrong');
    }
  }
}
