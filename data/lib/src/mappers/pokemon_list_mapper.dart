import 'package:data/data.dart';
import 'package:domain/domain.dart';

extension PokemonListMapper on PokemonList {
  static PokemonList fromJson(Map<dynamic, dynamic> json) {
    return PokemonList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonMapper.fromJson(e))
          .toList(),
    );
  }

  //
  // static PokemonList mapModelToEntity(PokemonListModel pokemonListModel) {
  //   return PokemonList(
  //     count: pokemonListModel.count,
  //     next: pokemonListModel.next,
  //     previous: pokemonListModel.previous,
  //     results: (pokemonListModel.results as List<dynamic>)
  //         .map((e) => PokemonMapper.mapModelToEntity(e))
  //         .toList(),
  //   );
  // }
  //TODO

  static PokemonListModel mapEntityToModel(PokemonList pokemonList) {
    return PokemonListModel(
      count: pokemonList.count,
      next: pokemonList.next,
      previous: pokemonList.previous,
      results: (pokemonList.results as List<PokemonEntity>)
          .map((e) => PokemonMapper.mapEntityToModel(e))
          .toList(),
    );
  }
}
