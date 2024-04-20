import 'package:flutter/material.dart';
import 'package:home/home.dart';

class PokemonApplication extends StatelessWidget {
  const PokemonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}
