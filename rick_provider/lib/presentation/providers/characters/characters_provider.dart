//TODO: Create CharacterProvider class extending from ChangeNotifier,
//this class should have a repository instance from an implementation and a list of characters as a property,
//an async method to get all characters.
//Also we should be able to change between two repository implementing different datasources.

import 'package:flutter/material.dart';
import 'package:rick_provider/infraestructure/datasources/characters_datasource_impl.dart';
import 'package:rick_provider/infraestructure/datasources/characters_datasource_json_impl.dart';
import 'package:rick_provider/infraestructure/repositories/character_repositorie_impl.dart';

import '../../../domain/entities/character.dart';

class CharacterProvider extends ChangeNotifier {
  final repository = CharacterRepositoryImpl(CharactersDataSourceImpl());
  final repositoryLocal = CharacterRepositoryImpl(CharactersDatasourceJsonImpl());

  List<Character> characters = [];

  Future<void> getAllCharacters() async {
    characters = await repositoryLocal.getAllCharacters();
    notifyListeners();
  }
}
