class PokemonDetails {
  final String name;
  final String imageURL;
  final List<String> types;
  final int weight;
  final int height;

  PokemonDetails({
    required this.name,
    required this.imageURL,
    required this.height,
    required this.types,
    required this.weight,
  });
}
