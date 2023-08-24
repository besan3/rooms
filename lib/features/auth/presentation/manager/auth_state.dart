part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthSuccessState extends AuthState {
  final LoginEntity loginEntity;

  @override
  List<Object> get props => [loginEntity];

  const AuthSuccessState({
    required this.loginEntity,
  });
}
class AuthRegisterSuccessState extends AuthState {
  final RegisterEntity registerEntity;

  @override
  List<Object> get props => [registerEntity];

  const AuthRegisterSuccessState({
    required this.registerEntity,
  });
}
class AuthGetProfileSuccessState extends AuthState {
  final ProfileEntity profileEntity;

  @override
  List<Object> get props => [profileEntity];

  const AuthGetProfileSuccessState({
    required this.profileEntity,
  });
}
class AuthPickImageSuccessState extends AuthState {
  final File image;

  @override
  List<Object> get props => [image];

  const AuthPickImageSuccessState({
    required this.image,
  });
}
class AuthErrorState extends AuthState {
  final String message;

  @override
  List<Object> get props => [message];

  const AuthErrorState({
    required this.message,
  });
}
class AuthVisiblePasswordState extends AuthState {
  @override
  List<Object> get props => [];

}
class AuthHiddenPasswordState extends AuthState {
  @override
  List<Object> get props => [];

}
