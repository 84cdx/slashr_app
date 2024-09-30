class Movie {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  List<int> genreIds;
  double popularity;
  String releaseDate;
  double voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"] ??
          "No title available", // Sicherstellen, dass es einen Fallback-Wert gibt
      backDropPath: json["backdrop_path"] ?? "", // Standardwert für null
      originalTitle: json["original_title"] ?? "No original title available",
      overview: json["overview"] ?? "No overview available",
      posterPath: json["poster_path"] ?? "", // Standardwert für das Poster
      genreIds:
          List<int>.from(json["genre_ids"]?.map((item) => item as int) ?? []),
      popularity: (json["popularity"] ?? 0).toDouble(),
      releaseDate: json["release_date"] ?? "Unknown release date",
      voteAverage: (json["vote_average"] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "backdrop_path": backDropPath,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "genre_ids": genreIds,
        "popularity": popularity,
        "release_date": releaseDate,
        "vote_average": voteAverage,
      };
}
