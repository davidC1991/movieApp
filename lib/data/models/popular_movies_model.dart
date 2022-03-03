// To parse this JSON data, do
//
//     final responsePopularMovies = responsePopularMoviesFromMap(jsonString);

import 'dart:convert';

class ResponsePopularMovies {
    ResponsePopularMovies({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int? page;
    List<ResultPopular>? results;
    int? totalPages;
    int? totalResults;



    factory ResponsePopularMovies.fromMap(Map<String, dynamic> json) => ResponsePopularMovies(
        page: json["page"],
        results: List<ResultPopular>.from(json["results"].map((x) => ResultPopular.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

  
}

class ResultPopular {
    ResultPopular({
        this.backdropPath,
        this.firstAirDate,
        this.genreIds,
        this.id,
        this.name,
        this.originCountry,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.popularity,
        this.posterPath,
        this.voteAverage,
        this.voteCount,
    });

    String? backdropPath;
    DateTime? firstAirDate;
    List<int>? genreIds;
    int? id;
    String? name;
    List<String>? originCountry;
    String? originalLanguage;
    String? originalName;
    String? overview;
    double? popularity;
    String? posterPath;
    double? voteAverage;
    int? voteCount;

    

    factory ResultPopular.fromMap(Map<String, dynamic> json) => ResultPopular(
        backdropPath: json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

   
}
