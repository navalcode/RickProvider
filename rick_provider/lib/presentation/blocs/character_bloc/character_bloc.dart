import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_provider/infraestructure/datasources/characters_datasource_impl.dart';
import 'package:rick_provider/infraestructure/repositories/character_repository_impl.dart';

import '../../../domain/entities/character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final _characterRepositoryImpl = CharacterRepositoryImpl(CharactersDatasourceImpl());

  CharacterBloc() : super(CharacterLoadingState()) {
    on<GetCharacters>((event, emit) async {
      emit(CharacterLoadingState());
      try{
        final characters = await _characterRepositoryImpl.getAllCharacters();
        emit(CharactersLoadedState(characters: characters));
      }catch (e) {
        emit(CharactersErrorState(error: e.toString()));
      }

    });

    on<LoadNextPage>((event, emit) async {
      emit(CharacterLoadingState());
      try {
        final characters = await _characterRepositoryImpl.getAllCharactersPaged(event.page);
        emit(CharactersLoadedState(characters: characters));
      } catch (e) {
        emit(CharactersErrorState(error: e.toString()));
      }
    });

  }
}
