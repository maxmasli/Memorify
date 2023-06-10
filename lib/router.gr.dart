// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MainMenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainMenuScreen(),
      );
    },
    MemoryGameRoute.name: (routeData) {
      final args = routeData.argsAs<MemoryGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MemoryGameScreen(
          memoPropertiesEntity: args.memoPropertiesEntity,
          key: args.key,
        ),
      );
    },
    RatingMenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RatingMenuScreen(),
      );
    },
    TutorialRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TutorialScreen(),
      );
    },
    MemoryCheckRoute.name: (routeData) {
      final args = routeData.argsAs<MemoryCheckRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MemoryCheckScreen(
          memoPropertiesEntity: args.memoPropertiesEntity,
          wordsList: args.wordsList,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [MainMenuScreen]
class MainMenuRoute extends PageRouteInfo<void> {
  const MainMenuRoute({List<PageRouteInfo>? children})
      : super(
          MainMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainMenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MemoryGameScreen]
class MemoryGameRoute extends PageRouteInfo<MemoryGameRouteArgs> {
  MemoryGameRoute({
    required MemoPropertiesEntity memoPropertiesEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MemoryGameRoute.name,
          args: MemoryGameRouteArgs(
            memoPropertiesEntity: memoPropertiesEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MemoryGameRoute';

  static const PageInfo<MemoryGameRouteArgs> page =
      PageInfo<MemoryGameRouteArgs>(name);
}

class MemoryGameRouteArgs {
  const MemoryGameRouteArgs({
    required this.memoPropertiesEntity,
    this.key,
  });

  final MemoPropertiesEntity memoPropertiesEntity;

  final Key? key;

  @override
  String toString() {
    return 'MemoryGameRouteArgs{memoPropertiesEntity: $memoPropertiesEntity, key: $key}';
  }
}

/// generated route for
/// [RatingMenuScreen]
class RatingMenuRoute extends PageRouteInfo<void> {
  const RatingMenuRoute({List<PageRouteInfo>? children})
      : super(
          RatingMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'RatingMenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TutorialScreen]
class TutorialRoute extends PageRouteInfo<void> {
  const TutorialRoute({List<PageRouteInfo>? children})
      : super(
          TutorialRoute.name,
          initialChildren: children,
        );

  static const String name = 'TutorialRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MemoryCheckScreen]
class MemoryCheckRoute extends PageRouteInfo<MemoryCheckRouteArgs> {
  MemoryCheckRoute({
    required MemoPropertiesEntity memoPropertiesEntity,
    required List<WordEntity> wordsList,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MemoryCheckRoute.name,
          args: MemoryCheckRouteArgs(
            memoPropertiesEntity: memoPropertiesEntity,
            wordsList: wordsList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MemoryCheckRoute';

  static const PageInfo<MemoryCheckRouteArgs> page =
      PageInfo<MemoryCheckRouteArgs>(name);
}

class MemoryCheckRouteArgs {
  const MemoryCheckRouteArgs({
    required this.memoPropertiesEntity,
    required this.wordsList,
    this.key,
  });

  final MemoPropertiesEntity memoPropertiesEntity;

  final List<WordEntity> wordsList;

  final Key? key;

  @override
  String toString() {
    return 'MemoryCheckRouteArgs{memoPropertiesEntity: $memoPropertiesEntity, wordsList: $wordsList, key: $key}';
  }
}
