import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/failure/failure.dart';

abstract interface class GetAllRatingRepository {
  Future<Either<Failure, List<RatingEntity>>> getAllRating();
}
