// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/presentation/providers/characters/characters_provider.dart';
import 'package:rick_provider/presentation/providers/characters_riverpod/characters_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

@override
  void initState() {
    super.initState();
    ref.read(charactersRiverpodProvider.notifier).loadCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final charactersFromRiverpod = ref.watch(charactersRiverpodProvider);
    //final charactersProvider = context.watch<CharacterProvider>();
    //charactersProvider.getAllCharacters();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick Provider"),
      ),
      body: SafeArea(
        child: charactersFromRiverpod.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CharactersGrid(characters: charactersFromRiverpod),
      ),
    );
  }
}

class CharactersGrid extends StatelessWidget {
  const CharactersGrid({
    super.key,
    required this.characters,
  });

  final List<Character> characters;

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
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final character = characters[index];
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
