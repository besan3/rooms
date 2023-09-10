import 'package:equatable/equatable.dart';
 class Comment extends Equatable{
  final bool status;
  final String message;
  final CommentEntity? data;
  const Comment({
    required this.status,
    required this.message,
    this.data
  });
  @override
  List<Object?> get props => [status,message,data];
}
class CommentEntity extends Equatable{
  final int currentPage;
  final List<CommentDataEntity> data;
  final String firstPageUrl;
  final int from;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;

  CommentEntity({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
  });

  @override
  List<Object?> get props => [
    currentPage,
    data,
    firstPageUrl,
    from,
    nextPageUrl,
    path,
    perPage,
    prevPageUrl,
    to,
  ];
}

class CommentDataEntity extends Equatable {
  final int id;
  final int userId;
  final int postId;
  final String body;
  final String createdAt;
  final CommentPostEntity post;

  CommentDataEntity({
    required this.id,
    required this.userId,
    required this.postId,
    required this.body,
    required this.createdAt,
    required this.post,
  });

  @override
  List<Object?> get props => [id, userId, postId, body, createdAt, post];
}

class CommentPostEntity extends Equatable {
  final int id;
  final int roomId;
  final int userId;
  final String body;
  final CommentRoomEntity room;
  final CommentUserEntity user;

  CommentPostEntity({
    required this.id,
    required this.roomId,
    required this.userId,
    required this.body,
    required this.room,
    required this.user,
  });

  @override
  List<Object?> get props => [id, roomId, userId, body, room, user];
}

class CommentRoomEntity extends Equatable {
  final int id;
  final int userId;
  final String name;

  CommentRoomEntity({
    required this.id,
    required this.userId,
    required this.name,
  });

  @override
  List<Object?> get props => [id, userId, name];
}

class CommentUserEntity extends Equatable {
  final int id;
  final String name;

  CommentUserEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
