import 'package:dartz/dartz.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/core/failure/failure.dart';

abstract interface class WordsGenerator {
  Future<Either<Failure, List<WordEntity>>> generateWords(int count);
}
