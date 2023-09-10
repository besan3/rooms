import 'package:rooms/features/home/data/models/room_models.dart';
import 'package:rooms/features/home/domain/entities/search_entity.dart';


class SearchModel extends SearchEntity {
  SearchModel({required super.status, required super.message, required super.data});
factory SearchModel.fromJson(Map<String, dynamic> json) {
return SearchModel(
status: json['status'],
message: json['message'],
data: SearchDataModel.fromJson(json['data']) ,
);
}
}
class SearchDataModel extends SearchData{
  SearchDataModel({required super.data,});
  factory SearchDataModel.fromJson(Map<String, dynamic>json){
    return SearchDataModel(data: json['data']
    .map<SearchDataResultModel>(
(dataJson) => SearchDataResultModel.fromJson((dataJson)))
    .toList(),

);

}

}
class SearchDataResultModel extends Data {
  SearchDataResultModel(
  {super.userId,
  super.image,
  super.name,
  super.participants,
  super.administrator,
  super.isPrivate,
  super.id,
  super.createdAt, });

  factory SearchDataResultModel.fromJson(Map<String, dynamic> json) {
    return SearchDataResultModel(
        id: json['id']??0,
        userId: json['user_id']??0,
        image: json['image']??'',
        name: json['name']??'',

        participants:json['participants']
            .map<ParticipantsModel>(
                (dataJson) => ParticipantsModel.fromJson((dataJson)))
            .toList(),
        createdAt: json['created_at'],
        administrator: json['administrator']!=null?AdminModel.fromJson(json['administrator']):null,
        isPrivate: json['is_private']);
  }
}



