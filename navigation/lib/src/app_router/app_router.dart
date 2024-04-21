import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';
import 'package:detailed_view/detailed_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(modules: [
  HomeModule,
  DetailedViewModule,
], replaceInRouteName: 'Screen, Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          initial: true,
        ),
        AutoRoute(
          page: DetailedViewRoute.page,
          path: '/details',
        )
      ];
}
