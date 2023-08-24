import 'package:rooms/features/auth/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity{
  const RegisterModel({required super.status, required super.message, required super.accessToken,super.data});
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
  return RegisterModel(
  status: json['status'],
  message: json['message'],
  accessToken: json['access_token']??'',
  data:json['data']!=null?NewUserDataModel.fromJson(json['data']):null

  );
  }
}

class NewUserDataModel extends NewUserData{
  const NewUserDataModel({required super.id, required super.firstName, required super.lastName, required super.name, required super.email});
  factory NewUserDataModel.fromJson(Map<String, dynamic> json) {
  return NewUserDataModel(
  id: json['id']??0,
  firstName: json['first_name']??'',
  lastName: json['last_name']??'',
  name: json['name']??'',
  email: json['email']??'');

  }
}