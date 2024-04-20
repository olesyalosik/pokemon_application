import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/home_bloc.dart';
import 'package:core/core.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
      if (state is HomeStateSuccess) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              centerTitle: true,
              iconTheme: Theme.of(context).iconTheme,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                AppTitles.nameOfApp,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: GridView.count(
                crossAxisCount: 1,
                children: List<Widget>.generate(
                    state.pokemons.results.length,
                    (index) => ListItem(
                          name: state.pokemons.results[index].name,
                        )),
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
        );
      }
    });
  }
}
