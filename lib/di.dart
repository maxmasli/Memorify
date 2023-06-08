import 'package:get_it/get_it.dart';
import 'package:memorify/core/data/local_data_source/rating_data_source.dart';
import 'package:memorify/core/data/repositories/rating_repository_impl.dart';
import 'package:memorify/features/rating_menu/domain/use_cases/calculate_properties_use_case.dart';
import 'package:memorify/features/rating_menu/domain/use_cases/get_rating_use_case.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;

void initDI() {
  final talker = Talker();
  getIt
    ..registerSingleton<Talker>(talker)

    //data sources
    ..registerLazySingleton<RatingDataSource>(RatingDataSourceImpl.new)

    //repos
    ..registerLazySingleton<RatingRepositoryImpl>(
      () => RatingRepositoryImpl(ratingDataSource: getIt<RatingDataSource>()),
    )

    //use cases
    ..registerFactory(CalculatePropertiesUseCase.new)
    ..registerFactory(
      () => GetRatingUseCase(ratingRepository: getIt<RatingRepositoryImpl>()),
    );
}
