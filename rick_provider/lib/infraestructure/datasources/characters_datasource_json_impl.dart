
//DON'T TOUCH THIS YET ;), we will be using this later


/*import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:rick_provider/domain/datasources/characters_datasource.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/infraestructure/mapper/character_mapper.dart';
import 'package:rick_provider/infraestructure/models/characters_response.dart';

class CharactersDatasourceJsonImpl extends CharactersDataSource {
  @override
  Future<List<Character>> getAllCharacters() async {
    // Cargar el archivo JSON desde los assets
    final String jsonString = await rootBundle.loadString('assets/characters.json');
    
    // Decodificar el JSON
    final jsonData = json.decode(jsonString);
    
    // Convertir el JSON decodificado a una lista de personajes
    final characterResponse = CharactersResponse.fromJson(jsonData);
    final List<Character> characters = characterResponse.results.map(
      (e) => CharacterMapper.characterToEntity(e),
    ).toList();
    
    return characters;
  }
}
*/