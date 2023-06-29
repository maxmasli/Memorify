import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';

class ResultWordEntity extends Equatable {
  const ResultWordEntity({
    required this.word,
    required this.answerWord,
  });

  final WordEntity word;
  final WordEntity answerWord;

  bool get isRight => word.word.trim() == answerWord.word.trim();

  @override
  List<Object> get props => [word, answerWord];
}
