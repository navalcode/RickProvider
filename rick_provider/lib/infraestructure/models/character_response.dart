class CharacterResponse {
    final int id;
    final String name;
    final Status status;
    final Species species;
    final String type;
    final Gender gender;
    final LocationResponse origin;
    final LocationResponse location;
    final String image;
    final List<String> episode;
    final String url;
    final DateTime created;

    CharacterResponse({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
        required this.episode,
        required this.url,
        required this.created,
    });

    factory CharacterResponse.fromJson(Map<String, dynamic> json) => CharacterResponse(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]] ?? Status.unknown,
        species: speciesValues.map[json["species"]] ?? Species.humanoid,
        type: json["type"],
        gender: genderValues.map[json["gender"]] ?? Gender.unknown,
        origin: LocationResponse.fromJson(json["origin"] ),
        location: LocationResponse.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
        "species": speciesValues.reverse[species],
        "type": type,
        "gender": genderValues.reverse[gender],
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}

enum Gender {
    female,
    male,
    unknown
}

final genderValues = EnumValues({
    "Female": Gender.female,
    "Male": Gender.male,
    "unknown": Gender.unknown
});

class LocationResponse {
    final String name;
    final String url;

    LocationResponse({
        required this.name,
        required this.url,
    });

    factory LocationResponse.fromJson(Map<String, dynamic> json) => LocationResponse(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

enum Species {
    alien,
    human,
    humanoid,
    unknown
}

final speciesValues = EnumValues({
    "Alien": Species.alien,
    "Human": Species.human,
    "Humanoid": Species.humanoid,
    "unknown": Species.unknown
});

enum Status {
    alive,
    dead,
    unknown
}

final statusValues = EnumValues({
    "Alive": Status.alive,
    "Dead": Status.dead,
    "unknown": Status.unknown
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
