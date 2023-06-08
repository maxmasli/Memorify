import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/failure/failure.dart';

abstract interface class GetRatingRepository {
  Future<Either<Failure, RatingEntity>> getRating();
}

abstract interface class SaveRatingRepository {
  Future<Either<Failure, void>> saveRating(RatingEntity ratingEntity);
}



