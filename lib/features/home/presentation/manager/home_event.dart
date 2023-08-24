part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}
class NavigateToNewScreenEvent extends HomeEvent{
  final int currentIndex;
  @override
  List<Object?> get props => [currentIndex];

  const NavigateToNewScreenEvent({
    required this.currentIndex,
  });
}
class GetHomeDataEvent extends HomeEvent{
  @override

  List<Object?> get props => [];

}
class LikeRoomEvent extends HomeEvent{
  @override

  List<Object?> get props => [];

}