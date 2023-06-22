import 'package:dartz/dartz.dart';
import 'package:memorify/core/failure/failure.dart';

abstract interface class DeleteRatingRepository{
  Future<Either<Failure, void>> deleteRating();
}
