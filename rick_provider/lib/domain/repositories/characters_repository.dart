
import 'package:rick_provider/domain/entities/character.dart';

abstract class CharactersRepository {
  Future<List<Character>> getAllCharacters();
}
