import 'package:domain/domain.dart';

class GetPokemonListUseCase extends FutureUseCase<String, PokemonListModel> {
  final PokemonRepository _pokemonRepository;

  GetPokemonListUseCase({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  @override
  Future<PokemonListModel> execute(String params) async {
    return await _pokemonRepository.getPokemonList(params);
  }
}
