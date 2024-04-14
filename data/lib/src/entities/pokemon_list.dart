import '../../data.dart';

class PokemonList {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonEntity> results;

  PokemonList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}
