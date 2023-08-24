import 'package:equatable/equatable.dart';

class RegisterInfo extends Equatable{
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String passwordConfirmation;

  @override
  List<Object?> get props => [firstName,lastName,email,password,passwordConfirmation];

  const RegisterInfo({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
}