import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:data/data.dart';
import 'package:pokemon_application/app/pokemon_application.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await dataDI.initHive();
  dataDI.initDependencies();
  appDI.initDependencies();
  runApp(const PokemonApplication());
}
