import 'package:data/src/providers/api_provider.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final ApiProvider apiProvider;

  PokemonRepositoryImpl({
    required this.apiProvider,
  });

  @override
  Future<PokemonDetailsModel> getPokemonDetails(String url) async {
    final PokemonDetails pokemonDetails =
        await apiProvider.getPokemonDetails(url);
    return PokemonDetailsMapper.mapEntityToModel(pokemonDetails);
  }

  @override
  Future<PokemonListModel> getPokemonList(String url) async {
    final PokemonList pokemonList = await apiProvider.getPokemonList(url);
    return PokemonListMapper.mapEntityToModel(pokemonList);
  }
}
