part of 'rating_menu_bloc.dart';

abstract base class RatingMenuEvent extends Equatable {
  const RatingMenuEvent();
}

final class CalculatePropertiesEvent extends RatingMenuEvent {
  @override
  List<Object?> get props => [];
}
