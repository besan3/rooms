import 'package:rooms/features/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({required super.status, required super.message, super.data});
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status']??false,
      message: json['message']??'',
      data: json['data'] != null ? HomeDataModel.fromJson(json['data']) : null,
    );
  }

Map<String, dynamic> toJson() {
  return {
    'message':message,
    'data':data,
    'status':status
  };
}
}

class HomeDataModel extends HomeDataEntity {
  HomeDataModel({required super.rooms});
  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      rooms: json['rooms']
          .map<RoomsModel>(
              (dataJson) => RoomsModel.fromJson((dataJson)))
          .toList(),
    );
  }
Map<String, dynamic> toJson() {
  return {
    'rooms':rooms.map<Map>((data) => data.toJson()).toList(),

  };
}
}

class RoomsModel extends RoomsEntity {
  RoomsModel(
      {required super.id,
      required super.userId,
      required super.name,
      required super.image,
      required super.isPrivate,
      required super.createdAt,
      required super.participantsCount,
      required super.postsCount,
      required super.administrator});
  factory RoomsModel.fromJson(Map<String, dynamic> json) {
    return RoomsModel(
        id: json['id']??0,
        userId: json['userId']??0,
        name: json['name']??'',
        image: json['image']??'',
        isPrivate: json['isPrivate']??0,
        createdAt: json['createdAt']??'',
        participantsCount: json['participantsCount']??0,
        postsCount: json['postsCount']??0,
        administrator:AdministratorModel.fromJson(json['administrator']));
  }

}
class AdministratorModel extends Administrator{
  AdministratorModel({required super.id, required super.name});
  factory AdministratorModel.fromJson(Map<String, dynamic>json){
    return AdministratorModel(id: json['id']??0, name: json['name']??'');
}
Map<String, dynamic> toJson() {
  return {
    'id':id,
    'name':name,
  };
}
}