import 'package:domain/domain.dart';

abstract class PokemonRepository {
  const PokemonRepository();

  Future<PokemonListModel> getPokemonList(String url);

  Future<PokemonDetailsModel> getPokemonDetails(String url);
}
