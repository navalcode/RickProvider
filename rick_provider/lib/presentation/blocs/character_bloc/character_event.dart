part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class GetCharacters extends CharacterEvent{
  @override
  List<Object> get props => [];
}

class LoadNextPage extends CharacterEvent {
  final int page;

  const LoadNextPage(this.page);

  @override
  List<Object> get props => [page];
}