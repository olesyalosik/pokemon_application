import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/home_bloc.dart';
import 'package:detailed_view/detailed_view.dart';
import 'package:navigation/navigation.dart';

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
            child: Text(AppTitles.networkError),
          ),
        );
      } else if (state is HomeStateSuccess) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.borderColor.withOpacity(0.5),
                    spreadRadius: 6,
                    blurRadius: 6,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: AppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15.0),
                )),
                backgroundColor: AppColors.primaryColor,
                title: Text(
                  AppTitles.nameOfApp,
                ),
                titleTextStyle: TextStyles.comfortaa_bold_24.copyWith(
                  color: AppColors.textColor,
                ),
                centerTitle: true,
              ),
            ),
          ),
          body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => appLocator<AppRouter>().push(DetailedViewRoute(
                        url: state.pokemons.results[index].url)),
                    child: ListItem(
                      name: state.pokemons.results[index].name,
                    ),
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
