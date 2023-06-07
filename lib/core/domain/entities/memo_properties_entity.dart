import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';

final class MemoPropertiesEntity extends Equatable {
  const MemoPropertiesEntity({
    required this.wordsCount,
    required this.time,
    required this.isRating,
    this.ratingEntity,
  });

  final int wordsCount;
  final int time;
  final bool isRating;
  final RatingEntity? ratingEntity;

  @override
  List<Object?> get props => [wordsCount, time, isRating, ratingEntity];
}
