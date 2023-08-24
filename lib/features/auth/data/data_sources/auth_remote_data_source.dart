import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rooms/core/errors/exceptions.dart';
import 'package:rooms/core/network/end_points.dart';
import 'package:rooms/core/network/local_storage.dart';
import 'package:rooms/features/auth/data/models/login_model.dart';
import 'package:rooms/features/auth/data/models/profile_model.dart';
import 'package:rooms/features/auth/data/models/register_model.dart';
import 'package:rooms/features/auth/domain/entities/register_info.dart';

abstract class AuthRemoteDataSource{
  Future<LoginModel>login(String email,String password);
  Future<RegisterModel>register(RegisterInfo registerInfo);
  Future<ProfileModel>getProfile();
  Future<ProfileModel>updateProfile(String firstName,String lastName,File image);
}
class AuthRemoteDataSourceImp implements AuthRemoteDataSource{
  final Dio dio;
  const AuthRemoteDataSourceImp({
    required this.dio,
  });
  @override
  Future<LoginModel> login(String email, String password)async {
    Response response=await dio.post(EndPoints.login,data:
    {
      'email':email,
      'password':password,
    }
    );

    if(response.statusCode==200){
      LoginModel loginModel=LoginModel.fromJson(response.data);
      SharedPrefs.saveData(key: 'token', value: loginModel.access_token);
      return loginModel;
    }
    else{
      throw ServerException();
    }
  }



  @override
  Future<RegisterModel> register(RegisterInfo registerInfo)async {
    Response response=await dio.post(EndPoints.register,data:
    {
      'first_name':registerInfo.firstName,
      'last_name':registerInfo.lastName,
      'email':registerInfo.email,
      'password':registerInfo.password,
      'password_confirmation':registerInfo.passwordConfirmation,
    }
    );
    if(response.statusCode==200){
      RegisterModel registerModel=RegisterModel.fromJson(response.data);
      return registerModel;
    }
    else{
      throw ServerException();
    }
  }

  @override
  Future<ProfileModel> getProfile()async {
    Response response=await dio.get(EndPoints.profile,
      options: Options(
        headers: {
    'Authorization': 'Bearer ${SharedPrefs.token}'
        }
      )
    );
    print(response.statusCode);
    if(response.statusCode==200){
      ProfileModel profileModel=ProfileModel.fromJson(response.data);
      SharedPrefs.saveData(key: 'profile', value: profileModel.data?.image);
      print(profileModel);
      return profileModel;
    }
    else{
      throw ServerException();
    }
  }

  @override
  Future<ProfileModel> updateProfile(String firstName, String lastName, File image)async {
    Response res=await dio.post('https://rooms.doos.info/api/users/profile',
        data: {
      'first_name':firstName,
      'last_name':lastName,
         // 'image':MultipartFile.fromFile(image.path,filename: image.path.split('/').last)

        },
        options: Options(
            headers: {
              'Authorization': 'Bearer ${SharedPrefs.token}'

            }
        )
    );
    print(res.statusCode);
    if(res.statusCode==200){
      ProfileModel profileModel=ProfileModel.fromJson(res.data);
      return profileModel;
    }
    else{
      throw ServerException();
    }
  }
}