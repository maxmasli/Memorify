import 'package:get_it/get_it.dart';
import 'package:memorify/core/data/local_data_source/rating_data_source.dart';
import 'package:memorify/core/data/repositories/rating_repository_impl.dart';
import 'package:memorify/features/memory_game/data/local_data_sources/words_data_source.dart';
import 'package:memorify/features/memory_game/data/repositories/words_generator_impl.dart';
import 'package:memorify/features/memory_game/domain/repositories/words_generator.dart';
import 'package:memorify/features/memory_game/domain/use_cases/generate_words_use_case.dart';
import 'package:memorify/features/rating_menu/domain/use_cases/calculate_properties_use_case.dart';
import 'package:memorify/features/rating_menu/domain/use_cases/get_rating_use_case.dart';
import 'package:memorify/features/results/domain/use_cases/calculate_obtained_rating_use_case.dart';
import 'package:memorify/features/results/domain/use_cases/compare_words_use_case.dart';
import 'package:memorify/features/results/domain/use_cases/save_rating_use_case.dart';
import 'package:memorify/features/statistics/domain/use_cases/delete_rating_use_case.dart';
import 'package:memorify/features/statistics/domain/use_cases/get_all_rating_use_case.dart';
import 'package:memorify/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;

void initDI() {
  final talker = Talker();
  getIt
    ..registerSingleton<Talker>(talker)
    ..registerSingleton<AppRouter>(AppRouter())

    //data sources
    ..registerLazySingleton<RatingDataSource>(RatingDataSourceImpl.new)
    ..registerLazySingleton<WordsDataSource>(WordsDataSourceImpl.new)

    //repos
    ..registerLazySingleton<RatingRepositoryImpl>(
      () => RatingRepositoryImpl(ratingDataSource: getIt<RatingDataSource>()),
    )
    ..registerLazySingleton<WordsGenerator>(
      () => WordsGeneratorImpl(wordsDataSource: getIt<WordsDataSource>()),
    )

    //use cases
    ..registerFactory(CalculatePropertiesUseCase.new)
    ..registerFactory(
      () => GetRatingUseCase(ratingRepository: getIt<RatingRepositoryImpl>()),
    )
    ..registerFactory(
      () => GenerateWordsUseCase(wordsGenerator: getIt<WordsGenerator>()),
    )
    ..registerFactory(CompareWordsUseCase.new)
    ..registerFactory(CalculateObtainedRatingUseCase.new)
    ..registerFactory(
      () => SaveRatingUseCase(ratingRepository: getIt<RatingRepositoryImpl>()),
    )
    ..registerFactory(
      () =>
          GetAllRatingUseCase(ratingRepository: getIt<RatingRepositoryImpl>()),
    )
    ..registerFactory(
      () =>
          DeleteRatingUseCase(ratingRepository: getIt<RatingRepositoryImpl>()),
    );
}
