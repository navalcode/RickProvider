import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/presentation/providers/characters/characters_provider.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final charactersProvider = context.watch<CharacterProvider>();
    charactersProvider.getAllCharacters();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick Provider"),
      ),
      body: SafeArea(
        child: charactersProvider.characters.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CharactersGrid(charactersProvider: charactersProvider),
      ),
    );
  }
}

class CharactersGrid extends StatelessWidget {
  const CharactersGrid({
    super.key,
    required this.charactersProvider,
  });

  final CharacterProvider charactersProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: charactersProvider.characters.length,
          itemBuilder: (context, index) {
            final character = charactersProvider.characters[index];
            return CharacterItem(character: character);
          }),
    );
  }
}

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                image: NetworkImage(character.image),
                placeholder: const AssetImage("assets/loading.gif"),
              ),
            ),
          ),
          Text(character.name),
        ],
      ),
      onTap: () => context.go("/character", extra: character),
    );
  }
}
