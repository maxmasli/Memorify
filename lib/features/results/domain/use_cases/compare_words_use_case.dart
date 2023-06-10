import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/result_entity.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/core/use_case/use_case.dart';

final class CompareWordsUseCase
    extends UseCase<ResultEntity, WordListCompareParam> {
  @override
  Future<Either<Failure, ResultEntity>> call(WordListCompareParam params) {
    final a = params.a;
    final b = params.b;
    assert(a.length == b.length, 'Lists for comparing has different lengths');

    var countGuessed = 0;
    var countWorng = 0;

    for (var i = 0; i < a.length; i++) {
      if (a[i].trim() == b[i].trim()) {
        countGuessed++;
      } else {
        countWorng++;
      }
    }

    return Future.value(
      Right(ResultEntity(countGuessed: countGuessed, countWrong: countWorng)),
    );
  }
}

final class WordListCompareParam extends Equatable {
  const WordListCompareParam({
    required this.a,
    required this.b,
  });

  final List<WordEntity> a;
  final List<WordEntity> b;

  @override
  List<Object> get props => [a, b];
}
