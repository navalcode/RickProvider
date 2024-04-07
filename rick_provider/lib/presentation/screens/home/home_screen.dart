import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_provider/presentation/providers/characters/characters_provider.dart';

import '../../../domain/entities/character.dart';

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
        ? Center(child: const CircularProgressIndicator())
        : CharactersGrid(charactersProvider: charactersProvider
        ),
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
            return CharacterItem(character: charactersProvider.characters[index],);
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
    return Text(character.name);
  }
}
