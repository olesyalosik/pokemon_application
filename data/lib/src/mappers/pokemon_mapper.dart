import 'package:data/data.dart';

extension PokemonMapper on PokemonEntity {
  static PokemonEntity fromJson(Map<dynamic, dynamic> json) {
    return PokemonEntity(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
