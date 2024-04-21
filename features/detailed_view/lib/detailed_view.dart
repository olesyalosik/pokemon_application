library detailed_view;

export 'src/ui/detailed_view_screen.dart';
import 'package:auto_route/auto_route.dart';

export 'detailed_view.gm.dart';
import 'detailed_view.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class DetailedViewModule extends $DetailedViewModule {}
