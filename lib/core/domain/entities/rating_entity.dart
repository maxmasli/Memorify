import 'package:equatable/equatable.dart';

class RatingEntity extends Equatable {
  const RatingEntity({
    required this.rating,
  });

  final int rating;

  String asCount() {
    if (rating > 0) {
      return '+$rating';
    } else {
      return '$rating';
    }
  }

  @override
  List<Object> get props => [rating];
}
