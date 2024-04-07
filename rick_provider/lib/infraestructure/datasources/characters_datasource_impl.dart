//TODO: create data source implementation for api call extending abstract datasource, use DIO for
//the api call

import 'package:dio/dio.dart';
import 'package:rick_provider/domain/datasources/characters_datasource.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/infraestructure/mapper/character_mapper.dart';
import 'package:rick_provider/infraestructure/models/characters_response.dart';

class CharactersDataSourceImpl extends CharactersDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api",
      headers: {"Content-type": "application/json"}));

  @override
  Future<List<Character>> getAllCharacters() async {
    final response = await dio.get("/character");
    final characterResponse = CharactersResponse.fromJson(response.data);
    final List<Character> characters = characterResponse.results
        .map(
          (e) => CharacterMapper.characterToEntity(e),
        )
        .toList();

    return characters;
  }
}
