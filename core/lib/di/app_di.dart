import 'package:get_it/get_it.dart';
import 'package:navigation/navigation.dart';

final GetIt appLocator = GetIt.instance;

final AppDI appDI = AppDI();

class AppDI {
  void initDependencies() {
    // _initAppRouter();
  }
}

// void _initAppRouter() {
//   appLocator.registerSingleton<AppRouter>(AppRouter());
// }
