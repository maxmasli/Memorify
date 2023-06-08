import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/features/rating_menu/domain/use_cases/calculate_properties_use_case.dart';
import 'package:test/test.dart';

void main() {
  test('testing calculating properties by rating', () async {
    final useCase = CalculatePropertiesUseCase();
    const rating = RatingEntity(rating: 100);

    late MemoPropertiesEntity props;
    (await useCase(const RatingParams(ratingEntity: rating))).fold(
      (l) => null,
      (r) => props = r,
    );

    expect(
      props,
      const MemoPropertiesEntity(
        wordsCount: 10,
        time: 140,
        isRating: true,
        ratingEntity: RatingEntity(rating: 100),
      ),
    );
  });
}
