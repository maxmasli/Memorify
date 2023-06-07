import 'package:equatable/equatable.dart';

final class ResultEntity extends Equatable {
  const ResultEntity({
    required this.countGuessed,
    required this.countWrong,
  });

  final int countGuessed;
  final int countWrong;

  @override
  List<Object> get props => [countGuessed, countWrong];
}
