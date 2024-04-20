import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/home_bloc.dart';

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
      if (state is HomeStateError) {
        return Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(AppTitles.networkError),
              ],
            ),
          ),
        );
      } else if (state is HomeStateSuccess) {
        return Scaffold(
          body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListItem(
                    name: state.pokemons.results[index].name,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: state.pokemons.results.length),
          ),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
        );
      }
    });
  }
}
