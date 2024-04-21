import 'package:domain/domain.dart';

class DetailedViewState {}

class DetailedViewStateSuccess extends DetailedViewState {
  final PokemonDetailsModel pokemonDetailsModel;

  DetailedViewStateSuccess({
    required this.pokemonDetailsModel,
  });
}

class DetailedViewStateError extends DetailedViewState {
  final String url;

  DetailedViewStateError({
    required this.url,
  });
}
