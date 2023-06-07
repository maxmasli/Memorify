import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/domain/repositories/rating_repository.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/core/params/params.dart';
import 'package:memorify/core/use_case/use_case.dart';

final class GetRatingUseCase extends UseCase<RatingEntity, NoParams> {
  GetRatingUseCase({required this.ratingRepository});

  final RatingRepository ratingRepository;

  @override
  Future<Either<Failure, RatingEntity>> call(NoParams params) {
    return ratingRepository.getRating();
  }
}
