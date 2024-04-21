import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/home_bloc.dart';
import 'home_form.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(
        initPokemonListUseCase: appLocator<InitPokemonListUseCase>(),
        getPokemonListUseCase: appLocator<GetPokemonListUseCase>(),
      )..add(
          InitEvent(),
        ),
      child: const HomeForm(),
    );
  }
}
