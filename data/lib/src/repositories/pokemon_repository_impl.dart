import 'package:data/src/providers/api_provider.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final ApiProvider apiProvider;

  PokemonRepositoryImpl({
    required this.apiProvider,
  });

  @override
  Future<PokemonDetails> getPokemonDetails(String url) {
    return apiProvider.getPokemonDetails(url);
  }

  @override
  Future<PokemonList> getPokemonList(String url) {
    return apiProvider.getPokemonList(url);
  }
}
