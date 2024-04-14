import 'package:domain/domain.dart';

class GetPokemonDetailsUseCase
    extends FutureUseCase<String, PokemonDetailsModel> {
  final PokemonRepository _pokemonRepository;

  GetPokemonDetailsUseCase({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  @override
  Future<PokemonDetailsModel> execute(String params) async {
    return await _pokemonRepository.getPokemonDetails(params);
  }
}
