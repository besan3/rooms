import 'package:equatable/equatable.dart';
class HomeEntity extends Equatable {
   final bool status;
   final String message;
   final  HomeDataEntity? data;

  @override
  List<Object?> get props => [status,message,data];

   const HomeEntity({
    required this.status,
    required this.message,
    this.data,
  });
}
class HomeDataEntity extends Equatable {
  final List<RoomsEntity> rooms;

  @override
  List<Object?> get props => rooms;

   const HomeDataEntity({
    required this.rooms,

  });
}
class RoomsEntity extends Equatable {
  final int id;
  final int userId;
  final String name;
  final String image;
  final int isPrivate;
  final String createdAt;
  final int participantsCount;
  final int postsCount;
  final Administrator administrator;
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'userId':userId,
      'name':name,
      'image':image,
      'isPrivate':isPrivate,
      'createdAt':createdAt,
      'participantsCount':participantsCount,
      'postsCount':postsCount,
      'administrator':administrator,
    };
  }

  @override
  List<Object?> get props => [id,userId,name,image,isPrivate,createdAt,participantsCount,postsCount,administrator];

  const RoomsEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.image,
    required this.isPrivate,
    required this.createdAt,
    required this.participantsCount,
    required this.postsCount,
    required this.administrator,
  });
}
class Administrator extends Equatable{
  final int id;
  final String name;

 const Administrator({required this.id, required this.name});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  @override

  List<Object?> get props =>[id,name];
}