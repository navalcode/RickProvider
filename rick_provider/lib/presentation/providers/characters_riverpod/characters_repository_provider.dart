import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_provider/infraestructure/datasources/characters_datasource_impl.dart';
import 'package:rick_provider/infraestructure/datasources/characters_datasource_json_impl.dart';
import 'package:rick_provider/infraestructure/repositories/character_repositorie_impl.dart';

final characterRepositoryProvider = Provider((ref) {
  return CharacterRepositoryImpl(CharactersDatasourceImpl());
  //return CharacterRepositoryImpl(CharactersDatasourceJsonImpl());
});