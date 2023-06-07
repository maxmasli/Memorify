import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/domain/entities/result_entity.dart';
import 'package:memorify/features/results/domain/use_cases/calculate_obtained_rating_use_case.dart';
import 'package:test/test.dart';

void main() {
  test('testing calculating obtained rating', () async {
    final useCase = CalculateObtainedRatingUseCase();
    late RatingEntity ratingEntity;
    (await useCase(
      const ResultParam(
        resultEntity: ResultEntity(countWrong: 7, countGuessed: 4),
      ),
    ))
        .fold(
      (l) => null,
      (r) => ratingEntity = r,
    );

    expect(ratingEntity, const RatingEntity(rating: -3));
  });
}
