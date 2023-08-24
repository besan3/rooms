import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rooms/core/errors/exceptions.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/core/network/local_storage.dart';
import 'package:rooms/core/network/network_info.dart';
import 'package:rooms/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:rooms/features/auth/data/models/login_model.dart';
import 'package:rooms/features/auth/domain/entities/login_entity.dart';
import 'package:rooms/features/auth/domain/entities/profile_entity.dart';
import 'package:rooms/features/auth/domain/entities/register_entity.dart';
import 'package:rooms/features/auth/domain/entities/register_info.dart';
import 'package:rooms/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;
  const AuthRepositoryImp({
    required this.authRemoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, LoginEntity>> login(String email, String password)async {
    try{
      if(await networkInfo.isConnected){
        var response=await  authRemoteDataSource.login(email, password);
        return Right(response);
      }else{
        return Left(ConnectionFailure());
      }
    }on DioException{
      var n=await SharedPrefs().getCachedLogin();
      if(n==Right(LoginModel)){
        return  Right(n);
      }else{
        return Left(ServerFailure());
      }

    }
  }



  @override
  Future<Either<Failure, RegisterEntity>> register(RegisterInfo registerInfo) async{
    try{
      if(await networkInfo.isConnected){
        var response=await  authRemoteDataSource.register(registerInfo);
        print(Right(response));
        return Right(response);
      }else{
        return Left(ConnectionFailure());
      }
    }on DioException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile()async {
    try{
      if(await networkInfo.isConnected){
        var response=await  authRemoteDataSource.getProfile();
        print(Right(response));
        return Right(response);
      }else{
        return Left(ConnectionFailure());
      }
    }on DioException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(String firstName, String lastName, File image)async {
    try{
      if(await networkInfo.isConnected){
        var response=await  authRemoteDataSource.updateProfile(firstName, lastName, image);
        print(response);
        return Right(response);
      }else{
        return Left(ConnectionFailure());
      }
    }on DioException{
      return Left(ServerFailure());
    }
  }
}