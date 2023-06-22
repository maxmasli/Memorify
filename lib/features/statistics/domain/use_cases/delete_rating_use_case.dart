import 'package:dartz/dartz.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/core/params/params.dart';
import 'package:memorify/core/use_case/use_case.dart';
import 'package:memorify/features/statistics/domain/repositories/delete_rating_repository.dart';

final class DeleteRatingUseCase extends UseCase<void, NoParams> {
  DeleteRatingUseCase({
    required this.ratingRepository,
  });

  final DeleteRatingRepository ratingRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return ratingRepository.deleteRating();
  }
}
