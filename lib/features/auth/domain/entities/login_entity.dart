import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable{
  final bool status;
  final String message;
  final String token_type;
  final String expires_in;
  final String access_token;
  final UserData? data;
  @override
  List<Object?> get props =>[status,message,token_type,expires_in,access_token,data];

  const LoginEntity({
    required this.status,
    required this.message,
    required this.token_type,
    required this.expires_in,
    required this.access_token,
     this.data,
  });
}

class UserData extends Equatable{
  final int id;
  final String first_name;
  final String last_name;
  final String name;
  final String email;
  final String image;

  @override
  List<Object?> get props => [id,first_name,last_name,name,email,image];

  const UserData({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.name,
    required this.email,
    required this.image,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}