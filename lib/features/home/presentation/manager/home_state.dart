part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}
class HomeNavigatedState extends HomeState {
final Widget screen;

  @override
  List<Object> get props => [screen];

const HomeNavigatedState({
    required this.screen,
  });
}
class GetHomeDataLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}
class GetHomeDataSuccessState extends HomeState {
  final HomeEntity homeEntity;

  @override
  List<Object> get props => [homeEntity];

  const GetHomeDataSuccessState({
    required this.homeEntity,
  });
}

class GetHomeDataErrorState extends HomeState {
  final String message;
  @override
  List<Object> get props => [message];

  const GetHomeDataErrorState({
    required this.message,
  });
}
class LikedState extends HomeState {
  @override
  List<Object> get props => [];
}
class DisLikedState extends HomeState {
  @override
  List<Object> get props => [];
}