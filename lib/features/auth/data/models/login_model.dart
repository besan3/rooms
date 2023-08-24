import 'package:rooms/core/extentions/check_null_values.dart';
import 'package:rooms/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity{
  const LoginModel(
      {required super.status,
      required super.message,
      required super.token_type,
      required super.expires_in,
      required super.access_token,
      required super.data});
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        status: json['status']??false,
        message: json['message']??'',
        token_type: json['token_type']??'',
        expires_in: json['expires_in']??'',
        access_token: json['access_token']??'',
        data:json['data']!=null?UserDataModel.fromJson(json['data']):null

);
  }

}

class UserDataModel extends UserData {
  const UserDataModel(
      {required super.id,
      required super.first_name,
      required super.last_name,
      required super.name,
      required super.email,
      required super.image});
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
        id: json['id']??0,
        first_name: json['first_name']??'',
        last_name: json['last_name']??'',
        name: json['name']??'',
        email: json['email']??'',
        image: json['image']??'');
  }
}
