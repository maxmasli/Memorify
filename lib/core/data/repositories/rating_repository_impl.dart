import 'package:dartz/dartz.dart';
import 'package:memorify/core/data/local_data_source/rating_data_source.dart';
import 'package:memorify/core/data/models/rating_model.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/domain/repositories/rating_repository.dart';
import 'package:memorify/core/failure/failure.dart';

class RatingRepositoryImpl
    implements GetRatingRepository, SaveRatingRepository {
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
}