
class ResponseEpisodeMovies {
    ResponseEpisodeMovies({
        this.airDate,
        this.crew,
        this.episodeNumber,
        this.guestStars,
        this.name,
        this.overview,
        this.id,
        this.productionCode,
        this.seasonNumber,
        this.stillPath,
        this.voteAverage,
        this.voteCount,
    });

    DateTime? airDate;
    List<Crew>? crew;
    int? episodeNumber;
    List<Crew>? guestStars;
    String? name;
    String? overview;
    int? id;
    String? productionCode;
    int? seasonNumber;
    String? stillPath;
    double? voteAverage;
    int? voteCount;

    factory ResponseEpisodeMovies.fromMap(Map<String, dynamic> json) => ResponseEpisodeMovies(
        airDate: DateTime.parse(json["air_date"]),
        crew: List<Crew>.from(json["crew"].map((x) => Crew.fromMap(x))),
        episodeNumber: json["episode_number"],
        guestStars: List<Crew>.from(json["guest_stars"].map((x) => Crew.fromMap(x))),
        name: json["name"],
        overview: json["overview"],
        id: json["id"],
        productionCode: json["production_code"],
        seasonNumber: json["season_number"],
        stillPath: json["still_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

 
}

class Crew {
    Crew({
        this.job,
        this.department,
        this.creditId,
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.character,
        this.order,
    });

    String? job;
    String? department;
    String? creditId;
    bool? adult;
    int? gender;
    int? id;
    String? knownForDepartment;
    String? name;
    String? originalName;
    double? popularity;
    String? profilePath;
    String? character;
    int? order;

   
    factory Crew.fromMap(Map<String, dynamic> json) => Crew(
        job: json["job"] == null ? null : json["job"],
        department: json["department"] == null ? null : json["department"],
        creditId: json["credit_id"],
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        character: json["character"] == null ? null : json["character"],
        order: json["order"] == null ? null : json["order"],
    );

   
}
