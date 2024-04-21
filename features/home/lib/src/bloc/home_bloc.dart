import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

import 'home_state.dart';
import 'home_event.dart';

export 'home_state.dart';
export 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRouter _appRouter;
  final GetPokemonListUseCase _getPokemonListUseCase;
  final InitPokemonListUseCase _initPokemonListUseCase;

  HomeBloc({
    required GetPokemonListUseCase getPokemonListUseCase,
    required InitPokemonListUseCase initPokemonListUseCase,
    required AppRouter appRouter,
  })  : _getPokemonListUseCase = getPokemonListUseCase,
        _initPokemonListUseCase = initPokemonListUseCase,
        _appRouter = appRouter,
        super(HomeState()) {
    on<InitEvent>(_onInitEvent);
    on<OpenPageEvent>(_onOpenPage);
  }

  Future<void> _onInitEvent(
    InitEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _initPokemonListUseCase.execute(NoParams());
    } catch (_) {
      emit(HomeStateError(URL: 'https://pokeapi.co/api/v2/pokemon'));
      return;
    }
    emit(HomeStateSuccess(
      pokemons: await _initPokemonListUseCase.execute(NoParams()),
    ));
  }

  Future<void> _onOpenPage(OpenPageEvent event, Emitter<HomeState> emit) async {
    try {
      await _getPokemonListUseCase.execute(event.url);
    } catch (_) {
      emit(HomeStateError(URL: event.url));
      return;
    }
    emit(HomeStateSuccess(
      pokemons: await _getPokemonListUseCase.execute(event.url),
    ));
  }
}
