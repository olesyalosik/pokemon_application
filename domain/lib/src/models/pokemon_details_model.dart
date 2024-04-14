import 'package:core/core.dart';

class PokemonDetailsModel extends Equatable {
  final String name;
  final String imageURL;
  final List<String> types;
  final int weight;
  final int height;

  PokemonDetailsModel({
    required this.weight,
    required this.types,
    required this.height,
    required this.imageURL,
    required this.name,
  });

  @override
  List<Object> get props => <Object>[
        name,
        imageURL,
        types,
        weight,
        height,
      ];
}
