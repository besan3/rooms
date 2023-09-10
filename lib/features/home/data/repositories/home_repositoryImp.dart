import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/core/network/network_info.dart';
import 'package:rooms/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:rooms/features/home/domain/entities/comment_entity.dart';
import 'package:rooms/features/home/domain/entities/home_entity.dart';
import 'package:rooms/features/home/domain/entities/room_details_entity.dart';
import 'package:rooms/features/home/domain/entities/search_entity.dart';
import 'package:rooms/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository{
  HomeRemoteDataSource homeRemoteDataSource;
  NetworkInfo networkInfo;

  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async{
    if(await networkInfo.isConnected){

        try{
          var result=await homeRemoteDataSource.getHomeData();
          return Right(result);
        }on DioException{
          return Left(ServerFailure());

      }
    }else{
      return Left(ConnectionFailure());
    }

  }

  HomeRepositoryImp({
    required this.homeRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, RoomDetailsEntity>> getRoomData(int roomId) async{
    if(await networkInfo.isConnected){

      try{
        var result=await homeRemoteDataSource.getRoomData(roomId);
        return Right(result);
      }on DioException{
        return Left(ServerFailure());

      }
    }else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, SearchEntity>> getSearchResults(String key)async {
    if(await networkInfo.isConnected){

      try{
        var result=await homeRemoteDataSource.getSearchResults(key);
        return Right(result);
      }on DioException{
        return Left(ServerFailure());

      }
    }else{
      return Left(ConnectionFailure());
    }  }

  @override
  Future<Either<Failure, Comment>> getPostComments(int post_id) async{
    if(await networkInfo.isConnected){
      try{
        var result=await homeRemoteDataSource.getPostComments(post_id);
        return Right(result);
      }on DioException{
        return Left(ServerFailure());
      }
    }
    else
      {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addRoom(String name, int is_private, File image) async{
    if(await networkInfo.isConnected){
      try{
        var result=await homeRemoteDataSource.addRoom(name, is_private, image);
        return Right(result);
      }on DioException{
        return Left(ServerFailure());
      }
    }
    else
    {
      return Left(ConnectionFailure());
    }
  }
}