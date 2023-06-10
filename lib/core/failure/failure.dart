import 'package:equatable/equatable.dart';

abstract base class Failure extends Equatable {

}

final class HiveFailure extends Failure {
  @override
  List<Object> get props => [];
}

final class WordsGeneratorFailure extends Failure {
  @override
  List<Object?> get props => [];
}

