// To parse this JSON data, do
//
//     final responseRecomendationsMovies = responseRecomendationsMoviesFromMap(jsonString);

import 'dart:convert';

class ResponseRecomendationsMovies {
    ResponseRecomendationsMovies({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int? page;
    List<ResultRecomendations>? results;
    int? totalPages;
    int? totalResults;

    factory ResponseRecomendationsMovies.fromJson(String str) => ResponseRecomendationsMovies.fromMap(json.decode(str));



    factory ResponseRecomendationsMovies.fromMap(Map<String, dynamic> json) => ResponseRecomendationsMovies(
        page: json["page"],
        results: List<ResultRecomendations>.from(json["results"].map((x) => ResultRecomendations.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

  
}

class ResultRecomendations {
    ResultRecomendations({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    bool? adult;
    String? backdropPath;
    List<int>? genreIds;
    int? id;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    DateTime? releaseDate;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;

   

    factory ResultRecomendations.fromMap(Map<String, dynamic> json) => ResultRecomendations(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

   
}
