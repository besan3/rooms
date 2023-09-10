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
class GetRoomDataLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}
class GetRoomDataSuccessState extends HomeState {
  final RoomDetailsEntity roomDetailsEntity;
  @override
  List<Object> get props => [roomDetailsEntity];

  const GetRoomDataSuccessState({
    required this.roomDetailsEntity,
  });
}
class GetRoomDataErrorState extends HomeState {
  final String message;
  @override
  List<Object> get props => [message];

  const GetRoomDataErrorState({
    required this.message,
  });
}
class GetSearchResultLoadingState extends HomeState{
  @override
  List<Object?> get props => [];

}
class GetSearchResultSuccessState extends HomeState{

  @override
  List<Object?> get props => [];


}
class GetSearchResultErrorState extends HomeState{
  final String message;
  @override
  List<Object?> get props => [message];

  const GetSearchResultErrorState({
    required this.message,
  });
}

class GetPostCommentLoadingState extends HomeState{
  @override
  List<Object?> get props => [];

}
class GetPostCommentSuccessState extends HomeState{
  final Comment comment;

  @override
  List<Object?> get props => [comment];

  const GetPostCommentSuccessState({
    required this.comment,
  });
}
class GetPostCommentErrorState extends HomeState {
  final String message;

  @override
  List<Object?> get props => [message];

  const GetPostCommentErrorState({
    required this.message,
  });
}
class AddRoomSuccessState extends HomeState{
  @override
  List<Object?> get props => [];


}
class AddRoomErrorState extends HomeState {
  final String message;

  @override
  List<Object?> get props => [message];

  const AddRoomErrorState({
    required this.message,
  });
}
class PickedImageState extends HomeState{
  final File image;
  @override
  List<Object?> get props => [image];

  const PickedImageState({
    required this.image,
  });
}
class SwitchOn  extends HomeState{
  @override
  List<Object?> get props => [];

}
class SwitchOff  extends HomeState{
  @override
  List<Object?> get props => [];

}