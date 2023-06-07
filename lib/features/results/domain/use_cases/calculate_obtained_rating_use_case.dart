import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/domain/entities/result_entity.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/core/use_case/use_case.dart';

final class CalculateObtainedRatingUseCase
    extends UseCase<RatingEntity, ResultParam> {
  @override
  Future<Either<Failure, RatingEntity>> call(ResultParam params) {
    const maxRating = 10;
    final result = params.resultEntity;
    final obtainedRating = (result.countGuessed - result.countWrong) /
        (result.countGuessed + result.countWrong) *
        maxRating;
    return Future.value(Right(RatingEntity(rating: obtainedRating.floor())));
  }
}

final class ResultParam extends Equatable {
  const ResultParam({required this.resultEntity});

  final ResultEntity resultEntity;

  @override
  List<Object?> get props => [resultEntity];
}
