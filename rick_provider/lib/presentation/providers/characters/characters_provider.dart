import 'package:flutter/material.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/infraestructure/datasources/characters_datasource_impl.dart';
import 'package:rick_provider/infraestructure/datasources/characters_datasource_json_impl.dart';
import 'package:rick_provider/infraestructure/repositories/character_repositorie_impl.dart';

class CharacterProvider extends ChangeNotifier {
  //JsonDataSource
  final repository = CharacterRepositoryImpl(CharactersDatasourceJsonImpl());
  //ApiDataSource
  //final repository = CharacterRepositoryImpl(CharactersDatasourceImpl());

  List<Character> characters = [] ;

  Future<void> getAllCharacters () async {
    characters = await repository.getAllCharacters();
    notifyListeners();
  }
}