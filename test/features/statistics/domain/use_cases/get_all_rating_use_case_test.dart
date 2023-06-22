import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/params/params.dart';
import 'package:memorify/features/statistics/domain/repositories/get_all_rating_repository.dart';
import 'package:memorify/features/statistics/domain/use_cases/get_all_rating_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockRepository extends Mock implements GetAllRatingRepository {}

void main() {
  test('test get all results', () async {
    final matcherList = [
      const RatingEntity(rating: 5),
      const RatingEntity(rating: 10),
      const RatingEntity(rating: 15),
      const RatingEntity(rating: 20),
    ];

    final mockRepository = MockRepository();
    when(mockRepository.getAllRating).thenAnswer(
      (_) => Future.value(Right(matcherList)),
    );

    final useCase = GetAllRatingUseCase(ratingRepository: mockRepository);

    late List<RatingEntity> ratingList;
    (await useCase(NoParams())).fold(
      (l) => null,
      (r) => ratingList = r,
    );
    expect(ratingList, matcherList);
  });
}
