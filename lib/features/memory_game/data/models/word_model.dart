import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';

class WordModel extends Equatable {

  const WordModel({
    required this.word,
  });

  factory WordModel.fromEntity(WordEntity entity) {
    return WordModel(word: entity.word);
  }

  final String word;

  WordEntity toEntity() {
    return WordEntity(word: word);
  }

  @override
  List<Object> get props => [word];
}
