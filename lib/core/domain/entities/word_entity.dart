import 'package:equatable/equatable.dart';

final class WordEntity extends Equatable {
  const WordEntity({
    required this.word,
  });

  final String word;

  @override
  List<Object> get props => [word];
}
