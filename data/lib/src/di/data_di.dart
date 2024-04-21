import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/src/providers/api_provider.dart';
import 'package:domain/domain.dart';
import 'package:hive/hive.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    appLocator.registerSingleton<Client>(
      Client(),
    );
    appLocator.registerSingleton<ApiProvider>(
      ApiProvider(
        dioClient: appLocator.get<Client>(),
      ),
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
    appLocator.registerFactory<InitPokemonListUseCase>(
      () => InitPokemonListUseCase(
        pokemonRepository: appLocator.get<PokemonRepository>(),
      ),
    );
  }

  Future<void> initHive() async {
    await Hive.openBox('listBox');
    await Hive.openBox('detailsBox');
  }
}
