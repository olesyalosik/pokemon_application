import 'package:domain/domain.dart';

class InitPokemonListUseCase extends FutureUseCase<NoParams, PokemonListModel> {
  final PokemonRepository _pokemonRepository;

  InitPokemonListUseCase({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  @override
  Future<PokemonListModel> execute(NoParams) async {
    return await _pokemonRepository.initPokemonList();
  }
}
