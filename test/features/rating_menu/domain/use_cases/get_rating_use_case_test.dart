import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/domain/repositories/rating_repository.dart';
import 'package:memorify/core/params/params.dart';
import 'package:memorify/features/rating_menu/domain/use_cases/get_rating_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockRepository extends Mock implements GetRatingRepository {}

void main() {
  test('testing get rating from repository using use case', () async {
    const matcher = 50;
    final mockRepository = MockRepository();
    when(mockRepository.getRating).thenAnswer((_) =>
        Future.value(const Right(RatingEntity(rating: matcher))));

    final useCase = GetRatingUseCase(ratingRepository: mockRepository);
    late int rating;
    (await useCase(NoParams())).fold((l) => null, (r) => rating = r.rating);

    expect(rating, matcher);
  });
}
