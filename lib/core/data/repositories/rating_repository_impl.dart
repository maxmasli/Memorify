import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/domain/repositories/rating_repository.dart';
import 'package:memorify/core/failure/failure.dart';

final class RatingRepositoryImpl implements RatingRepository {
  @override
  Future<Either<Failure, RatingEntity>> getRating() {
    return Future.value(const Right(RatingEntity(rating: 100)));
  }

  @override
  Future<Either<Failure, void>> saveRating(RatingEntity ratingEntity) {
    return Future.value(Left(HiveFailure()));
  }
}
