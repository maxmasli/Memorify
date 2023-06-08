import 'package:auto_route/auto_route.dart';
import 'package:memorify/features/main_menu/presentation/pages/main_menu_screen.dart';
import 'package:memorify/features/rating_menu/presentation/pages/rating_menu_screen.dart';
import 'package:memorify/features/tutorial/presentation/pages/tutorial_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainMenuRoute.page, path: '/'),
        CustomRoute(
          page: TutorialRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
        ),
        CustomRoute(
          page: RatingMenuRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
        ),
      ];
}
