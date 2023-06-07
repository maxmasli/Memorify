import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/core/use_case/use_case.dart';

final class CalculatePropertiesUseCase
    extends UseCase<MemoPropertiesEntity, RatingParams> {
  @override
  Future<Either<Failure, MemoPropertiesEntity>> call(RatingParams params) {
    final rating = params.ratingEntity.rating;
    final words = 5 + rating ~/ 20;
    final time = words * 24 - rating;

    return Future.value(
      Right(
        MemoPropertiesEntity(
          time: time,
          wordsCount: words,
          isRating: true,
          ratingEntity: params.ratingEntity,
        ),
      ),
    );
  }
}

class RatingParams extends Equatable {
  const RatingParams({required this.ratingEntity});

  final RatingEntity ratingEntity;

  @override
  List<Object> get props => [];
}
