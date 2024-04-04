import 'package:rick_provider/domain/entities/character.dart';
import 'package:rick_provider/domain/entities/location.dart';
import 'package:rick_provider/infraestructure/models/character_response.dart';

class CharacterMapper {
  static Character characterToEntity(CharacterResponse character) => Character(
      id: character.id,
      name: character.name,
      status: character.status.name,
      species: character.species.name,
      type: character.type,
      gender: character.gender.name,
      origin: Location(name: character.origin.name, url: character.origin.url),
      location:
          Location(name: character.location.name, url: character.location.url),
      image: character.image,
      episode: character.episode,
      url: character.url,
      created: character.created);
}
