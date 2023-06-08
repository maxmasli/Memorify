import 'package:hive_flutter/hive_flutter.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';

part 'rating_model.g.dart';

@HiveType(typeId: 1)
class RatingModel {

  const RatingModel({
    required this.rating,
  });

  factory RatingModel.fromEntity(RatingEntity entity) {
    return RatingModel(rating: entity.rating);
  }

  RatingEntity toEntity() {
    return RatingEntity(rating: rating);
  }

  @HiveField(0)
  final int rating;
}
