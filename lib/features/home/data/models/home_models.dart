import 'package:rooms/features/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity{
  HomeModel({required super.status, required super.message,super.data});
  factory HomeModel.fromJson(Map<String,dynamic>json){
    return HomeModel(status: json['status']??false, message:json ['message']??0,
data: json['data']!=null?PostModel.fromJson(json['data']):null
);
}
}
class PostModel extends PostEntity{
  PostModel({super.posts});
  factory PostModel.fromJson(Map<String,dynamic>json){
    return PostModel(
      posts: json['posts']!=null?PostsDataModel.fromJson(json['posts']):null
    );
  }

}
class PostsDataModel extends PostsDataEntity{
  PostsDataModel({required super.currentPage,super.data,super.perPage,super.path,super.nextPageUrl,super.from,super.firstPageUrl,super.to,super.prevPageUrl});
  factory PostsDataModel.fromJson(Map<String,dynamic>json){
    return PostsDataModel(currentPage: json['currentPage']??0,
    firstPageUrl: json['firstPageUrl']??'',
from: json['from']??0,
nextPageUrl: json['nextPageUrl']??'',
path: json['path']??'',
perPage: json['perPage']??0,
prevPageUrl: json['prevPageUrl']??'',
to: json['to']??0,
data: json['data']
    .map<PostDetailModel>(
(dataJson) => PostDetailModel.fromJson((dataJson)))
    .toList(),
  );
}
}
class PostDetailModel extends PostDetailEntity{
  PostDetailModel({required super.id, required super.userId, required super.roomId, required super.title, required super.body, required super.image, required super.createdAt, required super.commentsCount,super.room,super.user});
factory PostDetailModel.fromJson(Map<String,dynamic>json){
return PostDetailModel(id: json['id']??0, userId: json['userId']??0, roomId: json['roomId']??0, title: json['title']??'', body: json['body']??'', image:json ['image']??'', createdAt:json ['createdAt']??'', commentsCount: json['commentsCount']??0,
room:json['room']!=null?PostRoomModel.fromJson(json['room']):null,
user:json['user']!=null?PostUserModel.fromJson(json['user']):null,
);
}
}
class PostUserModel extends PostUser{
  PostUserModel({required super.id, required super.name});
  factory PostUserModel.fromJson(Map<String,dynamic>json){
    return PostUserModel(id: json['id']??0, name: json['name']??'');
}
}
class PostRoomModel extends PostRoom{
  PostRoomModel({required super.id, required super.userId, required super.name, required super.image, required super.isPrivate, required super.isActive, required super.createdAt, required super.updatedAt, required super.deletedAt});
  factory PostRoomModel.fromJson(Map<String,dynamic>json){
    return PostRoomModel(id:json ['id']??0, userId:json ['userId']??0, name: json['name']??'', image:json ['image']??'', isPrivate:json ['isPrivate']??0, isActive:json ['isActive']??0, createdAt:json ['createdAt']??'', updatedAt:json ['updatedAt']??'', deletedAt: json['deletedAt']??'');
}
}