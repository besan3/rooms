import 'package:rooms/features/home/domain/entities/comment_entity.dart';

class CommentModel extends Comment {
  CommentModel({required super.status, required super.message,super.data});
factory CommentModel.fromJson(Map<String, dynamic> json) {
return CommentModel(
status: json['status'],
message: json['message'],
data: json['data'] != null ? CommentEntityModel.fromJson(json['data']) : null,
);
}


}

class CommentEntityModel extends CommentEntity {
  CommentEntityModel({required super.currentPage, required super.data, required super.firstPageUrl,super.prevPageUrl,super.nextPageUrl, required super.from, required super.path, required super.perPage, required super.to});

      factory CommentEntityModel.fromJson(Map<String, dynamic> json) {
      return CommentEntityModel(
      currentPage: json['current_page']??0,
      data: (json['data'] as List).map((e) => CommentDataModel.fromJson(e)).toList(),
      firstPageUrl: json['first_page_url']??'',
      from: json['from']??0,
      nextPageUrl: json['next_page_url']??'',
      path: json['path']??'',
      perPage: json['per_page']??0,
      prevPageUrl: json['prev_page_url']??'',
      to: json['to']??0,
      );
      }



}

class CommentDataModel extends CommentDataEntity {
  CommentDataModel({required super.id, required super.userId, required super.postId, required super.body, required super.createdAt, required super.post});
  factory CommentDataModel.fromJson(Map<String, dynamic> json) {
  return CommentDataModel(
  id: json['id'],
  userId: json['user_id'],
  postId: json['post_id'],
  body: json['body'],
  createdAt: json['created_at'],
  post: CommentPostModel.fromJson(json['post']),
  );
  }


}

class CommentPostModel extends CommentPostEntity {
  CommentPostModel({required super.id, required super.roomId, required super.userId, required super.body, required super.room, required super.user});
    factory CommentPostModel.fromJson(Map<String, dynamic> json) {
    return CommentPostModel(
    id: json['id'],
    roomId: json['room_id'],
    userId: json['user_id'],
    body: json['body'],
    room: CommentRoomModel.fromJson(json['room']),
    user: CommentUserModel.fromJson(json['user']),
    );
    }


}

class CommentRoomModel extends CommentRoomEntity {
  CommentRoomModel({required super.id, required super.userId, required super.name});
  factory CommentRoomModel.fromJson(Map<String, dynamic> json) {
  return CommentRoomModel(
  id: json['id'],
  userId: json['user_id'],
  name: json['name'],
  );
  }


}

class CommentUserModel extends CommentUserEntity {
  CommentUserModel({required super.id, required super.name});
    factory CommentUserModel.fromJson(Map<String, dynamic> json) {
    return CommentUserModel(
    id: json['id'],
    name: json['name'],
    );
    }


}
