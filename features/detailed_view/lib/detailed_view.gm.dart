// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:detailed_view/src/ui/detailed_view_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

abstract class $DetailedViewModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    DetailedViewRoute.name: (routeData) {
      final args = routeData.argsAs<DetailedViewRouteArgs>();
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailedViewScreen(
          url: args.url,
          key: args.key,
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.DetailedViewScreen]
class DetailedViewRoute extends _i2.PageRouteInfo<DetailedViewRouteArgs> {
  DetailedViewRoute({
    required String url,
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          DetailedViewRoute.name,
          args: DetailedViewRouteArgs(
            url: url,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailedViewRoute';

  static const _i2.PageInfo<DetailedViewRouteArgs> page =
      _i2.PageInfo<DetailedViewRouteArgs>(name);
}

class DetailedViewRouteArgs {
  const DetailedViewRouteArgs({
    required this.url,
    this.key,
  });

  final String url;

  final _i3.Key? key;

  @override
  String toString() {
    return 'DetailedViewRouteArgs{url: $url, key: $key}';
  }
}
