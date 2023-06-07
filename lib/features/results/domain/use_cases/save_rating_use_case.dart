import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/repositories/rating_repository.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/core/use_case/use_case.dart';
import 'package:memorify/features/rating_menu/domain/use_cases/calculate_properties_use_case.dart';

final class SaveRatingUseCase extends UseCase<void, RatingParams> {

  SaveRatingUseCase({required this.ratingRepository});

  final RatingRepository ratingRepository;

  @override
  Future<Either<Failure, void>> call(RatingParams params) {
    return ratingRepository.saveRating(params.ratingEntity);
  }
}
