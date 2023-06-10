import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/di.dart';
import 'package:memorify/features/memory_game/data/local_data_sources/words_data_source.dart';
import 'package:memorify/features/memory_game/domain/repositories/words_generator.dart';

class WordsGeneratorImpl implements WordsGenerator {

  const WordsGeneratorImpl({
    required this.wordsDataSource,
  });

  final WordsDataSource wordsDataSource;

  @override
  Future<Either<Failure, List<WordEntity>>> generateWords(int count) async {
    try {
      final list = wordsDataSource.getRandomWords(count);
      return Future.value(Right(list.map((e) => e.toEntity()).toList()));
    } catch (e) {
      return Future.value(Left(WordsGeneratorFailure()));
    }
  }
}
