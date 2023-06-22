import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/failure/failure.dart';
import 'package:memorify/core/params/params.dart';
import 'package:memorify/core/use_case/use_case.dart';
import 'package:memorify/features/statistics/domain/repositories/get_all_rating_repository.dart';

final class GetAllRatingUseCase extends UseCase<List<RatingEntity>, NoParams> {
  GetAllRatingUseCase({required this.ratingRepository});

  final GetAllRatingRepository ratingRepository;

  @override
  Future<Either<Failure, List<RatingEntity>>> call(NoParams params) async {
    // final ratingList = <RatingEntity>[];
    // for (var i = 0; i < 100; i++) {
    //   final r = RatingEntity(rating: Random().nextInt(100));
    //   ratingList.add(r);
    // }
    // debugPrint(ratingList.length.toString());
    // return Future.value(Right(ratingList));
    return ratingRepository.getAllRating();
  }
}
