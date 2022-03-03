class ResponseVideoMovies {
    ResponseVideoMovies({
        this.id,
        this.results,
    });

    int? id;
    List<Result>? results;

    
    factory ResponseVideoMovies.fromMap(Map<String, dynamic> json) => ResponseVideoMovies(
        id: json["id"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );

   
}

class Result {
    Result({
        this.iso6391,
        this.iso31661,
        this.name,
        this.key,
        this.site,
        this.size,
        this.type,
        this.official,
        this.publishedAt,
        this.id,
    });

    String? iso6391;
    String? iso31661;
    String? name;
    String? key;
    String? site;
    int? size;
    String? type;
    bool? official;
    DateTime? publishedAt;
    String? id;

    
    factory Result.fromMap(Map<String, dynamic> json) => Result(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
    );

}
