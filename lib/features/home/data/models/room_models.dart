import 'package:rooms/features/home/data/models/home_models.dart';
import 'package:rooms/features/home/domain/entities/room_details_entity.dart';

class RoomDetailsModel extends RoomDetailsEntity {
  RoomDetailsModel({required super.status, required super.message, super.data});
  factory RoomDetailsModel.fromJson(Map<String, dynamic> json) {
    return RoomDetailsModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? RoomDataModel.fromJson(json['data']) : null,
    );
  }
}

class RoomDataModel extends RoomDataEntity {
  RoomDataModel(
      {super.userId,
      super.image,
      super.name,
      super.posts,
      super.participants,
      super.administrator,
      super.isPrivate,
      super.id,
      super.createdAt});

  factory RoomDataModel.fromJson(Map<String, dynamic> json) {
    return RoomDataModel(
        id: json['id']??0,
        userId: json['userId']??0,
        image: json['image']??'',
        name: json['name']??'',
        posts: json['posts']
            .map<PostsModel>(
                (dataJson) => PostsModel.fromJson((dataJson)))
            .toList(),
        participants:json['participants']
            .map<ParticipantsModel>(
                (dataJson) => ParticipantsModel.fromJson((dataJson)))
            .toList(),
        administrator: AdministratorModel.fromJson(json['administrator']),
        createdAt: json['createdAt'],
        isPrivate: json['isPrivate']);
  }
}

class ParticipantsModel extends Participants {
  ParticipantsModel({required super.id, required super.name, required super.pivot});
  factory ParticipantsModel.fromJson(Map<String, dynamic> json){
  return ParticipantsModel(
  id: json['id']??0,
  name: json['name']??'',
  pivot: PivotModel.fromJson(json['pivot']),
  );
  }
}
class PivotModel extends Pivot{
  PivotModel({required super.roomId, required super.userId});
  factory PivotModel.fromJson(Map<String, dynamic> json){
    return PivotModel(
    roomId: json['roomId']??0,
    userId: json['userId']??0,
    );
    }
}
class PostsModel extends Posts{
  PostsModel({required super.id, required super.userId, required super.roomId, required super.body,super.image,super.comments});
factory PostsModel.fromJson(Map<String, dynamic> json) {
return PostsModel(
id: json['id']??0,
userId: json['userId']??0,
roomId: json['roomId']??0,
body: json['body']??'',
image: json['image']??'',
comments: json['comments']
    .map<CommentsModel>(
(dataJson) => CommentsModel.fromJson((dataJson)))
    .toList(),
);
}
}
class CommentsModel extends Comments{
  CommentsModel({required super.id, required super.userId,  required super.body, required super.postId});
factory CommentsModel.fromJson(Map<String, dynamic> json) {
return CommentsModel(
id: json['id']??0,
userId: json['userId']??0,
postId: json['postId']??0,
body: json['body']??'',
);
}
}
