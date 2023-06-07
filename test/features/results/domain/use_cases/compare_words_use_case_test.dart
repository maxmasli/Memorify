import 'package:memorify/core/domain/entities/result_entity.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/features/results/domain/use_cases/compare_words_use_case.dart';
import 'package:test/test.dart';

void main() {
  test('testing comparing to list of words', () async {
    final a = [
      const WordEntity(word: 'dog'),
      const WordEntity(word: 'cat'),
      const WordEntity(word: 'bird')
    ];
    final b = [
      const WordEntity(word: 'dog'),
      const WordEntity(word: 'idk'),
      const WordEntity(word: 'bird')
    ];
    final useCase = CompareWordsUseCase();
    late ResultEntity result;
    (await useCase(WordListCompareParam(a: a, b: b))).fold(
      (l) => null,
      (r) => result = r,
    );

    expect(result, const ResultEntity(countGuessed: 2, countWrong: 1));
  });
}
