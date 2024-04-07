// To parse this JSON data, do
//
//     final charactersResponse = charactersResponseFromJson(jsonString);

import 'dart:convert';

import 'package:rick_provider/infraestructure/models/character_response.dart';

CharactersResponse charactersResponseFromJson(String str) => CharactersResponse.fromJson(json.decode(str));

String charactersResponseToJson(CharactersResponse data) => json.encode(data.toJson());

class CharactersResponse {
    final Info info;
    final List<CharacterResponse> results;

    CharactersResponse({
        required this.info,
        required this.results,
    });

    factory CharactersResponse.fromJson(Map<String, dynamic> json) => CharactersResponse(
        info: Info.fromJson(json["info"]),
        results: List<CharacterResponse>.from(json["results"].map((x) => CharacterResponse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Info {
    final int count;
    final int pages;
    final String next;
    final dynamic prev;

    Info({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

