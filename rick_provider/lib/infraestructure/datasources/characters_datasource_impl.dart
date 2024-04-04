import 'package:dio/dio.dart';
import 'package:rick_provider/domain/datasources/characters_datasource.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/infraestructure/mapper/character_mapper.dart';
import 'package:rick_provider/infraestructure/models/characters_response.dart';

class CharactersDatasourceImpl extends CharactersDataSource {
      final dio = Dio(
        BaseOptions(
          baseUrl: "https://rickandmortyapi.com/api",
          headers: {
            "Content-Type": "application/json",
          },
          )
      );

  @override
  Future<List<Character>> getAllCharacters() async {
    final response = await dio.get("/character");
    final characterResponse = CharactersResponse.fromJson(response.data);
    final List<Character> characters = characterResponse.results.map(
      (e) => CharacterMapper.characterToEntity(e),
      ).toList();
    return characters;
  }
  
}