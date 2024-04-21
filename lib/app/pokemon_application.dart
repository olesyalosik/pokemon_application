import 'package:core/di/app_di.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.dart';

class PokemonApplication extends StatelessWidget {
  const PokemonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appLocator.get<AppRouter>().delegate(),
      routeInformationParser: appLocator.get<AppRouter>().defaultRouteParser(),
    );
  }
}
