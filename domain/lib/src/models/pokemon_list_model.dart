import 'package:domain/domain.dart';
import 'package:core/core.dart';

class PokemonListModel extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonModel> results;

  PokemonListModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  @override
  List<Object> get props => <Object>[
        count,
        results,
      ];
}
