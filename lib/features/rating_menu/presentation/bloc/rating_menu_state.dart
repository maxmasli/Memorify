part of 'rating_menu_bloc.dart';

abstract base class RatingMenuState extends Equatable {
  const RatingMenuState();
}

final class RatingMenuInitial extends RatingMenuState {
  @override
  List<Object> get props => [];
}

final class RatingMenuLoaded extends RatingMenuState {
  const RatingMenuLoaded({required this.memoPropertiesEntity});

  final MemoPropertiesEntity memoPropertiesEntity;

  @override
  List<Object> get props => [memoPropertiesEntity];
}

final class RatingMenuLoading extends RatingMenuState {
  @override
  List<Object?> get props => [];
}

final class RatingMenuFailure extends RatingMenuState {
  @override
  List<Object?> get props => [];
}
