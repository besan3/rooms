import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart'as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/auth/data/models/register_model.dart';
import 'package:rooms/features/auth/domain/entities/login_entity.dart';
import 'package:rooms/features/auth/domain/entities/profile_entity.dart';
import 'package:rooms/features/auth/domain/entities/register_entity.dart';
import 'package:rooms/features/auth/domain/entities/register_info.dart';
import 'package:rooms/features/auth/domain/use_cases/get_profile_usecase.dart';
import 'package:rooms/features/auth/domain/use_cases/login_usecase.dart';
import 'package:rooms/features/auth/domain/use_cases/register-usecase.dart';
import 'package:rooms/features/auth/domain/use_cases/update_profile_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final GetProfileUseCase profileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailCodeController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
    File? image;
 bool isVisibile = false;
  var formKey = GlobalKey<FormState>();
  LoginEntity loginEntity = const LoginEntity(
      status: false,
      message: '',
      token_type: '',
      expires_in: '',
      access_token: '',
      data: UserData(
          id: 0,
          first_name: '',
          last_name: '',
          name: '',
          email: '',
          image: ''));
  RegisterEntity registerEntity = const RegisterModel(status: false, message: '', accessToken: '');
  ProfileEntity profileEntity=const ProfileEntity(status: false, message: '', data: UserData(
      id: 0,
      first_name: '',
      last_name: '',
      name: '',
      email: '',
      image: ''));

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.profileUseCase,
    required this.updateProfileUseCase,
  }) : super(AuthInitial()) {

    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(AuthLoadingState());
        var result = await loginUseCase.call(event.email, event.password);
      print(result);

        emit(result.fold((l) => AuthErrorState(message:l is ConnectionFailure?'Check Your Internet Connection': l.toString()), (r) {

          loginEntity = r;
          add(GetProfileEvent());
          if(r.status==true) {
          return AuthSuccessState(loginEntity: loginEntity);}
          else{
            return AuthErrorState(message:r.message);
          }
        }));
      }
      if (event is RegisterEvent) {
        emit(AuthLoadingState());
        var result = await registerUseCase.call(event.registerInfo);

        emit(result.fold((l) {

          return AuthErrorState(message:l is ConnectionFailure?'Check Your Internet Connection': l.toString());
        }, (r) {
          registerEntity=r;

          if(r.status==true) {
            return AuthRegisterSuccessState(registerEntity: r);
          }else{
            return AuthErrorState(message:r.message);
          }
        }));
      }
      if (event is GetProfileEvent) {
        emit(AuthLoadingState());
        var result = await profileUseCase.call();
        print(result);

        emit(result.fold((l) {

          return AuthErrorState(message:l is ConnectionFailure?'Check Your Internet Connection': l.toString());
        }, (r) {
          profileEntity=r;
            return AuthGetProfileSuccessState(profileEntity: profileEntity);

        }));
      }
      if (event is UpdateProfileEvent) {
        emit(AuthLoadingState());
        var result = await updateProfileUseCase.call(event.firstName??'', event.lastName??'', event.image!);
        print(result);
        print(profileEntity);
        emit(result.fold((l) {

          return AuthErrorState(message: l.toString());
        }, (r) {
          profileEntity=r;
            return AuthGetProfileSuccessState(profileEntity: r);

        }));
      }
      if(event is ToggleVisibilityEvent){
        if(state is AuthInitial)
        emit(AuthVisiblePasswordState());
        else{
          emit(AuthInitial());

        }

      }
    });


  }

  @override
  Future<void> close()async {
    emailController.dispose();
    passwordController.dispose();
    super.close();
  }

}
