import 'package:equatable/equatable.dart';

import 'home_entity.dart';
class RoomDetailsEntity extends Equatable{
 final bool? status;
 final String? message;
  RoomDataEntity? data;

  RoomDetailsEntity({required this.status,required this.message, this.data});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
  @override
  List<Object?> get props => [status,message,data];

}
class RoomDataEntity extends Equatable{
  final int? id;
  final int? userId;
  final String? name;
  final String? image;
  final int? isPrivate;
  final String? createdAt;
  final Administrator? administrator;
  final List<Participants>? participants;
  final List<Posts>? posts;
  @override
  List<Object?> get props =>[id,userId,name,image,isPrivate,createdAt,administrator,participants,posts];

  RoomDataEntity({
    this.id,
    this.userId,
    this.name,
    this.image,
    this.isPrivate,
    this.createdAt,
    this.administrator,
    this.participants,
    this.posts,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['is_private'] = this.isPrivate;
    data['created_at'] = this.createdAt;
    if (this.administrator != null) {
      data['administrator'] = this.administrator!.toJson();
    }
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Participants extends Equatable {
  final int id;
  final String name;
  final Pivot pivot;

  Participants({required this.id, required this.name, required this.pivot});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }

  @override

  List<Object?> get props => [id,name,pivot];
}

class Pivot extends Equatable{
  final int roomId;
  final int userId;

  Pivot({required this.roomId, required this.userId, });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['user_id'] = this.userId;

    return data;
  }

  @override
  List<Object?> get props => [userId,roomId];
}

class Posts extends Equatable{
  final int id;
  final int userId;
  final int roomId;
  final String body;
  final String? image;
  final List<Comments>? comments;

  Posts(
      {required this.id,
        required this.userId,
        required this.roomId,
        required this.body,
        this.image,
        this.comments});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['room_id'] = this.roomId;
    data['body'] = this.body;
    data['image'] = this.image;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [id,userId,roomId,body,image,comments];
}

class Comments extends Equatable{
  final int id;
  final int userId;
  final int postId;
  final String body;

  Comments({required this.id, required this.userId, required this.postId, required this.body});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['body'] = this.body;
    return data;
  }

  @override
  List<Object?> get props =>[id,userId,postId,body];
}