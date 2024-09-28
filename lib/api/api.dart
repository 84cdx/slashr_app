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

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something went wrong');
    }
  }
}
