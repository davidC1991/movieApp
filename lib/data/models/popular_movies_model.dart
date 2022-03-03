
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

    factory ResponsePopularMovies.fromJson(String str) => ResponsePopularMovies.fromMap(json.decode(str));


    factory ResponsePopularMovies.fromMap(Map<String, dynamic> json) => ResponsePopularMovies(
        page: json["page"],
        results: List<ResultPopular>.from(json["results"].map((x) => ResultPopular.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

 
}

class ResultPopular {
    ResultPopular({
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
    OriginalLanguage? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    DateTime? releaseDate;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;

    factory ResultPopular.fromJson(String str) => ResultPopular.fromMap(json.decode(str));

   

    factory ResultPopular.fromMap(Map<String, dynamic> json) => ResultPopular(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: originalLanguageValues.map![json["original_language"]],
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

enum OriginalLanguage { EN, JA, HI }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "hi": OriginalLanguage.HI,
    "ja": OriginalLanguage.JA
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
