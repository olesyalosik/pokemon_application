import 'dart:ui';

import 'package:data/data.dart';
import 'package:data/src/mappers/pokemon_mapper.dart';

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
}
