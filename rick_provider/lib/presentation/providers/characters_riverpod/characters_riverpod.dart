//Crear un StateNotifierProvider con riverpod para characters, es decir,
//un proveedor de información que notificará cuando cambie el estado.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/presentation/providers/characters_riverpod/characters_repository_provider.dart';

final charactersRiverpodProvider =
    StateNotifierProvider<CharactersNotifier, List<Character>>((ref) {
  final fetchCharacters = ref.watch(characterRepositoryProvider).getAllCharacters;

  return CharactersNotifier(fetchCharacters: fetchCharacters);
});

typedef CharacterCallback = Future<List<Character>> Function();

class CharactersNotifier extends StateNotifier<List<Character>> {
  CharacterCallback fetchCharacters;

  CharactersNotifier({
    required this.fetchCharacters,
  }) : super([]);

  Future<void> loadCharacters() async {
    final List<Character> characters = await fetchCharacters();
    state = [...state, ...characters];
  }
}
