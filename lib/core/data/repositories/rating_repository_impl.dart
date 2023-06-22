import 'package:dartz/dartz.dart';
import 'package:memorify/core/data/local_data_source/rating_data_source.dart';
import 'package:memorify/core/data/models/rating_model.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/features/results/domain/repositories/save_rating_repository.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/features/rating_menu/domain/repositories/get_rating_repository.dart';
import 'package:memorify/features/statistics/domain/repositories/get_all_rating_repository.dart';

class RatingRepositoryImpl
    implements
        GetRatingRepository,
        SaveRatingRepository,
        GetAllRatingRepository {
  const RatingRepositoryImpl({
    required RatingDataSource ratingDataSource,
  }) : _ratingDataSource = ratingDataSource;

  final RatingDataSource _ratingDataSource;

  @override
  Future<Either<Failure, RatingEntity>> getRating() async {
    try {
      final ratingModel = await _ratingDataSource.getRating();
      return Right(ratingModel.toEntity());
    } catch (e) {
      return Left(HiveFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveRating(RatingEntity ratingEntity) async {
    try {
      return Right(
        await _ratingDataSource.saveRating(
          RatingModel.fromEntity(ratingEntity),
        ),
      );
    } catch (e) {
      return Left(HiveFailure());
    }
  }

  @override
  Future<Either<Failure, List<RatingEntity>>> getAllRating() async {
    try {
      final ratingList = (await _ratingDataSource.getAllRating())
          .map((e) => e.toEntity())
          .toList();
      return Right(ratingList);
    } catch (e) {
      return Left(HiveFailure());
    }
  }
}
