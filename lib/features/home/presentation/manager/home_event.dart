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
  int index;
  @override

  List<Object?> get props => [index];

  LikeRoomEvent({
    required this.index,
  });
}
class GetRoomDetailsEvent extends HomeEvent{
  final int roomId;
  @override
  List<Object?> get props => [roomId];

  GetRoomDetailsEvent({
    required this.roomId,
  });
}
class GetSearchResultEvent extends HomeEvent{
  final String key;
  @override
  List<Object?> get props => [key];
  GetSearchResultEvent({
    required this.key,
  });
}
class GetPostCommentsEvent extends HomeEvent{
  final int post_id;
  @override
  List<Object?> get props => [post_id];
  GetPostCommentsEvent({
    required this.post_id,
  });
}
class AddRoomEvent extends HomeEvent{
  final String name;
  final int is_private;
  final File image;
  @override
  List<Object?> get props => [name, is_private, image];

  const AddRoomEvent({
    required this.name,
    required this.is_private,
    required this.image,
  });
}
class PickImageEvent extends HomeEvent{
  @override
  List<Object?> get props => throw UnimplementedError();

}
class SwitchEvent extends HomeEvent{
  @override
  List<Object?> get props => [];


}