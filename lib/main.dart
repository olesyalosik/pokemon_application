import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:data/data.dart';
import 'package:pokemon_application/app/pokemon_application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await dataDI.initDependencies();
  appDI.initDependencies();
  dataDI.initDependencies();
  runApp(const PokemonApplication());
}
