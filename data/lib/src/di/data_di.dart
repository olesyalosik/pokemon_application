import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/src/providers/api_provider.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    appLocator.registerSingleton<ApiProvider>(
      ApiProvider(dioClient: appLocator.get<Client>()),
    );
    appLocator.registerSingleton<Client>(
      Client(),
    );
    appLocator.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(
        apiProvider: appLocator.get<ApiProvider>(),
      ),
    );
    appLocator.registerFactory<GetPokemonDetailsUseCase>(
      () => GetPokemonDetailsUseCase(
        pokemonRepository: appLocator.get<PokemonRepository>(),
      ),
    );
    appLocator.registerFactory<GetPokemonListUseCase>(
      () => GetPokemonListUseCase(
        pokemonRepository: appLocator.get<PokemonRepository>(),
      ),
    );
    appLocator
        .registerFactory<InitPokemonListUseCase>(() => InitPokemonListUseCase(
              pokemonRepository: appLocator.get<PokemonRepository>(),
            ));
  }
}
