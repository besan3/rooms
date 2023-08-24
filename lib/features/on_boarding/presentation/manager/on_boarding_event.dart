part of 'on_boarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();
}
class OnBoardingNavigateEvent extends OnBoardingEvent{
  final int index;
  @override

  List<Object?> get props => [index];

  OnBoardingNavigateEvent({
    required this.index,
  });
}