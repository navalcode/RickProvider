
//TODO: Create CharacterRepositoryImpl class, it should extend from abstract CharacterRespository
// use an abstract property for CharacterDataSource and create constructor. 

//this repository will be the join between our datasource and repository

import 'package:rick_provider/domain/datasources/characters_datasource.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/domain/repositories/characters_repository.dart';

class CharacterRepositoryImpl extends CharactersRepository {
  final CharactersDataSource dataSource;
  CharacterRepositoryImpl(this.dataSource);
  
  @override
  Future<List<Character>> getAllCharacters() {
    return dataSource.getAllCharacters();
  }
  
}