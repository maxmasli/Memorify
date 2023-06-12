import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/features/main_menu/presentation/pages/main_menu_screen.dart';
import 'package:memorify/features/memory_check/presentation/pages/memory_check_screen.dart';
import 'package:memorify/features/memory_game/presentation/pages/memory_game_screen.dart';
import 'package:memorify/features/rating_menu/presentation/pages/rating_menu_screen.dart';
import 'package:memorify/features/results/presentation/pages/results_screen.dart';
import 'package:memorify/features/training_menu/presentation/pages/training_menu_screen.dart';
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
        CustomRoute(
          page: MemoryGameRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
        ),
        CustomRoute(
          page: MemoryCheckRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
        ),
        CustomRoute(
          page: ResultsRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
        ),
        CustomRoute(
          page: TrainingMenuRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
        ),
      ];
}
