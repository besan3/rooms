part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}
class InitialEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
class LoginEvent extends AuthEvent {

  final String email;
  final String password;

  const LoginEvent({

    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email,password];
}
class RegisterEvent extends AuthEvent {

  final RegisterInfo registerInfo;

  const RegisterEvent({

    required this.registerInfo,
  });

  @override
  List<Object?> get props => [registerInfo];
}
class GetProfileEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
class UpdateProfileEvent extends AuthEvent {
   String? firstName;
   String? lastName;
   File? image;

  @override
  List<Object?> get props => [];

   UpdateProfileEvent({
    this.firstName,
    this.lastName,
    this.image,
  });

}
class PickImageEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
class ToggleVisibilityEvent extends AuthEvent {

  @override
  List<Object?> get props => [];

}