import 'package:dio/dio.dart';

class PokemonRepository {
  Future<void> getPokemonList() async {
    final response = await Dio().get(
        'https://pokeapi.co/api/v2/pokemon'
    ),
  }
}
