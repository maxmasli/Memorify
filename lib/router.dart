import 'package:auto_route/auto_route.dart';
import 'package:memorify/features/main_menu/presentation/pages/main_menu_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainMenuRoute.page, path: '/'),
  ];
}
