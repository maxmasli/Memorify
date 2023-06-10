import 'package:equatable/equatable.dart';

class WordEntity extends Equatable {
  const WordEntity({
    required this.word,
  });

  final String word;

  @override
  List<Object> get props => [word];

  @override
  String toString() {
    return "Word: $word";
  }
}
