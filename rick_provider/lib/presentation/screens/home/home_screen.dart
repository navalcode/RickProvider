import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/presentation/blocs/character_bloc/character_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => CharacterBloc(),
    child: const BlocHomeScreen()
    );
  }
}

class BlocHomeScreen extends StatelessWidget {

  const BlocHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final characterBloc = BlocProvider.of<CharacterBloc>(context);
    characterBloc.add(GetCharacters());
    //characterBloc.add(const LoadNextPage(2));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick Provider"),
      ),
      body: SafeArea(
        child: BlocBuilder<CharacterBloc, CharacterState> (
          builder: (context, state) {
            if (state is CharacterLoadingState){
              return const Center(child: CircularProgressIndicator(),);
            }
            if (state is CharactersErrorState){
              return Center(child: Text(state.error),);
            }

            if (state is CharactersLoadedState){
              return CharactersGrid(characters: state.characters);

            }
            return Container();
          }
        )
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
