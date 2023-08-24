import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable{
  final bool status;
  final String message;
  final String accessToken;
  final NewUserData? data;
  @override
  List<Object?> get props =>[status,message,accessToken,data];

  const RegisterEntity({
    required this.status,
    required this.message,
    required this.accessToken,
    this.data,
  });
}

class NewUserData extends Equatable{
  final int id;
  final String firstName;
  final String lastName;
  final String name;
  final String email;


  @override
  List<Object?> get props => [id,firstName,lastName,name,email];

  const NewUserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.email,
  });
}