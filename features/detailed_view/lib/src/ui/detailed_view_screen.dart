import 'package:core/core.dart';
import 'package:detailed_view/src/bloc/detailed_view_bloc.dart';
import 'package:detailed_view/src/ui/detailed_view_form.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class DetailedViewScreen extends StatelessWidget {
  final String url;

  const DetailedViewScreen({
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailedViewBloc(
        getPokemonDetailsUseCase: appLocator<GetPokemonDetailsUseCase>(),
      )..add(
          InitDetailsEvent(url: url),
        ),
      child: const DetailedViewForm(),
    );
  }
}
