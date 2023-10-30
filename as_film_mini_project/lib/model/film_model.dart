class FilmModel {
  String title;
  String backdropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  FilmModel({
    required this.title,
    required this.backdropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,

  });

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
      title: json ["title"], 
      backdropPath: json ["backdrop_path"], 
      originalTitle: json ["original_title"],  
      overview: json ["overview"], 
      posterPath: json ["poster_path"], 
      releaseDate: json ["release_date"],
      voteAverage: json ["vote_average"].toDouble(),
    );
  }
}