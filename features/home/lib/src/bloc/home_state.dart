import 'package:core/core.dart';
import 'package:domain/domain.dart';

class HomeState {}

class HomeStateSuccess extends HomeState {
  final PokemonListModel pokemons;

  HomeStateSuccess({
    required this.pokemons,
  });

}

class HomeStateError extends HomeState {
  final String URL;

  HomeStateError({
    required this.URL,
  });
}