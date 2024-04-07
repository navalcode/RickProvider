part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Character> get props => [];
}

class CharacterLoadingState extends CharacterState {}

class CharactersLoadedState extends CharacterState {
  final List<Character> characters;
  const CharactersLoadedState({required this.characters});

  @override
  List<Character> get props => [];
}

class CharactersErrorState extends CharacterState {
  final String error;
  const CharactersErrorState({required this.error});
  
}
