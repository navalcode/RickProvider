import 'package:flutter/material.dart';
import 'package:rick_provider/domain/entities/character.dart';
import 'package:url_launcher/url_launcher.dart';

class CharacterScreen extends StatelessWidget {
  static const name = "character-screen";
  final Character? character;
  const CharacterScreen({super.key, this.character});

  @override
  Widget build(BuildContext context) {
    if (character == null) {
      return const NoCharacterLoaded();
    } else {
      return CharacterLoaded(character: character!);
    }
  }
}

class CharacterLoaded extends StatelessWidget {
  final Character character;

  const CharacterLoaded({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Status: ${character.status}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Species: ${character.species}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Gender: ${character.gender}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Origin: ${character.origin.name}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Location: ${character.location.name}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                        placeholder: const AssetImage('assets/loading.gif'),
                        image: NetworkImage(character.image))),
                        onTap: () {
                          //open device web browser
                          launchUrl(Uri.parse(character.url));
                        },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoCharacterLoaded extends StatelessWidget {
  const NoCharacterLoaded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personajes"),
      ),
      body: const Center(
          child: Text("Se ha producido un error al cargar el personaje")),
    );
  }
}
