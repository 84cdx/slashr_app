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
      title: json["title"],
      //title: (json["title"] ?? "no-title") as String,
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      genreIds: List<int>.from(json["genre_ids"].map((item) => item as int)),
      popularity: json["popularity"].toDouble(),
      releaseDate: json["release_date"].toString(),
      voteAverage: json["vote_average"].toDouble(),
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
