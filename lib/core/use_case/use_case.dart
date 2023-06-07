import 'package:dartz/dartz.dart';
import 'package:memorify/core/failure/failure.dart';

abstract base class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
