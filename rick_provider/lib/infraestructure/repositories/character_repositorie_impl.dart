import 'package:rick_provider/domain/datasources/characters_datasource.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/domain/repositories/characters_repository.dart';

class CharacterRepositoryImpl extends CharactersRepository{
  final CharactersDataSource dataSource;
  CharacterRepositoryImpl(this.dataSource);

  @override
  Future<List<Character>> getAllCharacters() {
    return dataSource.getAllCharacters();
  }
  
}