import 'package:core/core.dart';

class PokemonModel extends Equatable {
  final String name;
  final String url;

  PokemonModel({
    required this.name,
    required this.url,
  });

  @override
  List<Object> get props => <Object>[
        name,
        url,
      ];
}
