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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    AppTitles.networkError,
                    style: TextStyles.comfortaa_bold_24,
                  ),
                ),
                InkWell(
                  onTap: () => BlocProvider.of<HomeBloc>(context).add(
                    OpenPageEvent(url: state.URL),
                  ),
                  child: Icon(
                    size: 50.0,
                    color: AppColors.primaryColor,
                    Icons.restart_alt_sharp,
                  ),
                )
              ],
            ),
          ),
        );
      } else if (state is HomeStateSuccess) {
        return Scaffold(
          bottomNavigationBar: Container(
            height: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimension.barBorderRadius),
                topLeft: Radius.circular(Dimension.barBorderRadius),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.barBorderRadius),
                topRight: Radius.circular(Dimension.barBorderRadius),
              ),
              child: BottomNavigationBar(
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.cardColor,
                items: <BottomNavigationBarItem>[
                  state.pokemons.previous != null
                      ? const BottomNavigationBarItem(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                          ),
                          label: 'previous',
                        )
                      : const BottomNavigationBarItem(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: AppColors.textColor,
                          ),
                          label: 'previous',
                        ),
                  state.pokemons.next != null
                      ? const BottomNavigationBarItem(
                          icon: Icon(Icons.arrow_forward_ios_rounded),
                          label: 'next',
                        )
                      : const BottomNavigationBarItem(
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.textColor,
                          ),
                          label: 'next',
                        ),
                ],
                onTap: (int index) {
                  if (index == 0 && state.pokemons.previous != null) {
                    BlocProvider.of<HomeBloc>(context)
                        .add(OpenPageEvent(url: state.pokemons.previous!));
                  } else if (index == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('There is no previous page'),
                      ),
                    );
                  }
                  if (index == 1 && state.pokemons.next != null) {
                    BlocProvider.of<HomeBloc>(context)
                        .add(OpenPageEvent(url: state.pokemons.next!));
                  } else if (index == 1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('There is no next page'),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              Dimension.appBarWidth,
            ),
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
                automaticallyImplyLeading: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                      Dimension.borderRadius,
                    ),
                  ),
                ),
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
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                      width: Dimension.divider,
                    ),
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
