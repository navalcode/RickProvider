
import 'package:rick_provider/domain/entities/character.dart';

abstract class CharactersDataSource {
  Future<List<Character>> getAllCharacters();
}
