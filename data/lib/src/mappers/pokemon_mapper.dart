import 'package:data/data.dart';
import 'package:domain/domain.dart';

extension PokemonMapper on PokemonEntity {
  static PokemonEntity fromJson(Map<dynamic, dynamic> json) {
    return PokemonEntity(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  static PokemonModel mapEntityToModel(PokemonEntity pokemonEntity) {
    return PokemonModel(
      name: pokemonEntity.name,
      url: pokemonEntity.url,
    );
  }

  static PokemonEntity mapModeltoEntity(PokemonModel pokemonModel) {
    return PokemonEntity(
      name: pokemonModel.name,
      url: pokemonModel.url,
    );
  }
}
