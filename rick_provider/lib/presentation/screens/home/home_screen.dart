import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick Provider"),
      ),
      body: const SafeArea(
        //TODO: Handle provider data and show spinner instead
        child:CharactersGrid(),
      ),
    );
  }
}

class CharactersGrid extends StatelessWidget {
  const CharactersGrid({
    super.key,
    //required this.charactersProvider,
  });

  //final CharacterProvider charactersProvider;

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
          itemCount: 10,
          itemBuilder: (context, index) {
            return CharacterItem();
          }),
    );
  }
}

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    //required this.character,
  });

  //final Character character;

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
