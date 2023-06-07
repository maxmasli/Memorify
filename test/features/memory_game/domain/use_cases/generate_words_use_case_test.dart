import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/features/memory_game/domain/repositories/words_generator.dart';
import 'package:memorify/features/memory_game/domain/use_cases/generate_words_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockRepository extends Mock implements WordsGenerator {}

void main() {
  test('testing generate words use case', () async {
    final mockRepository = MockRepository();

    when(() => mockRepository.generateWords(2)).thenAnswer(
      (_) =>
          Future.value(const Right(<WordEntity>[WordEntity(word: 'p1'), WordEntity(word: 'p2')])),
    );

    final useCase = GenerateWordsUseCase(wordsGenerator: mockRepository);
    late List<WordEntity> list;
    (await useCase(const CountParams(count: 2))).fold(
      (l) => null,
      (r) => list = r,
    );
    expect(list, [const WordEntity(word: 'p1'), const WordEntity(word: 'p2')]);
  });
}
