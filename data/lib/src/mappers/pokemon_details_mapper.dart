import 'package:data/data.dart';
import 'package:domain/domain.dart';

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

  static PokemonDetailsModel mapEntityToModel(PokemonDetails pokemonDetails) {
    return PokemonDetailsModel(
      weight: pokemonDetails.weight,
      types: pokemonDetails.types,
      height: pokemonDetails.height,
      imageURL: pokemonDetails.imageURL,
      name: pokemonDetails.name,
    );
  }

  static PokemonDetails mapModelToEntity(
      PokemonDetailsModel pokemonDetailsModel) {
    return PokemonDetails(
      name: pokemonDetailsModel.name,
      imageURL: pokemonDetailsModel.imageURL,
      height: pokemonDetailsModel.height,
      types: pokemonDetailsModel.types,
      weight: pokemonDetailsModel.weight,
    );
  }
}
