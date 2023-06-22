import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/core/params/params.dart';
import 'package:memorify/core/use_case/use_case.dart';
import 'package:memorify/features/rating_menu/domain/repositories/get_rating_repository.dart';

final class GetRatingUseCase extends UseCase<RatingEntity, NoParams> {
  GetRatingUseCase({required this.ratingRepository});

  final GetRatingRepository ratingRepository;

  @override
  Future<Either<Failure, RatingEntity>> call(NoParams params) async {
    return ratingRepository.getRating();
  }
}
