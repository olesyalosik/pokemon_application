import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'detailed_view_event.dart';
import 'detailed_view_state.dart';

export 'detailed_view_state.dart';
export 'detailed_view_event.dart';

class DetailedViewBloc extends Bloc<DetailedViewEvent, DetailedViewState> {
  final GetPokemonDetailsUseCase _getPokemonDetailsUseCase;

  DetailedViewBloc({
    required GetPokemonDetailsUseCase getPokemonDetailsUseCase,
  })  : _getPokemonDetailsUseCase = getPokemonDetailsUseCase,
        super(DetailedViewState()) {
    on<InitDetailsEvent>(_onInitDetails);
  }

  Future<void> _onInitDetails(
      InitDetailsEvent event, Emitter<DetailedViewState> emit) async {
    try {
      await _getPokemonDetailsUseCase.execute(event.url);
    } catch (_) {
      emit(DetailedViewStateError(url: event.url));
      return;
    }
    emit(DetailedViewStateSuccess(
      pokemonDetailsModel: await _getPokemonDetailsUseCase.execute(event.url),
    ));
  }
}
