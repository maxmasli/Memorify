import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/core/use_case/use_case.dart';
import 'package:memorify/features/memory_game/domain/repositories/words_generator.dart';

final class GenerateWordsUseCase extends UseCase<List<WordEntity>, CountParams> {
  GenerateWordsUseCase({required this.wordsGenerator});

  final WordsGenerator wordsGenerator;

  @override
  Future<Either<Failure, List<WordEntity>>> call(CountParams params) {
    return wordsGenerator.generateWords(params.count);
  }
}

final class CountParams extends Equatable {
  const CountParams({required this.count});

  final int count;

  @override
  List<Object?> get props => [count];
}
