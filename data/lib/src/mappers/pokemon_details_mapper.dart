import 'package:data/data.dart';

extension PokemonDetailsMapper on PokemonDetails {
  static PokemonDetails fromJson(Map<dynamic, dynamic> json) {
    return PokemonDetails(
      name: json['name'] as String,
      imageURL:
          (json['sprites'] as Map<dynamic, dynamic>)['front_default'] as String,
      height: json['height'] as int,
      types: (json['types'] as List<dynamic>)
          .map((e) => ((e as Map<dynamic, dynamic>)['type']['name'] as String))
          .toList(),
      weight: json['weight'] as int,
    );
  }
}
