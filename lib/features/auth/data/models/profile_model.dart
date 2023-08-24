import 'package:rooms/features/auth/data/models/login_model.dart';
import 'package:rooms/features/auth/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity{
  const ProfileModel({required super.status, required super.message, required super.data});
  factory ProfileModel.fromJson(Map<String, dynamic>json){
    return ProfileModel(status:json ['status'], message:json ['message'],
  data:json['data']!=null? UserDataModel.fromJson(json['data']):null);
}
}