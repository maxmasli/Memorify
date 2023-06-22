import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/core/params/params.dart';
import 'package:memorify/core/use_case/use_case.dart';
import 'package:memorify/features/statistics/domain/repositories/get_all_rating_repository.dart';

final class GetAllRatingUseCase extends UseCase<List<RatingEntity>, NoParams> {
  GetAllRatingUseCase({required this.ratingRepository});

  final GetAllRatingRepository ratingRepository;

  @override
  Future<Either<Failure, List<RatingEntity>>> call(NoParams params) async {
    return ratingRepository.getAllRating();
  }
}
