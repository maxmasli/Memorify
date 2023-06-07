import 'package:equatable/equatable.dart';

final class RatingEntity extends Equatable {
  const RatingEntity({
    required this.rating,
  });

  final int rating;

  @override
  List<Object> get props => [rating];
}
