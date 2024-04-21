library home;

export 'src/ui/home_screen.dart';
import 'package:auto_route/auto_route.dart';
export 'package:home/home.gm.dart';
import 'package:home/home.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class HomeModule extends $HomeModule {}
