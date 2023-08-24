import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/core/network/local_storage.dart';
import 'package:rooms/core/network/network_info.dart';
import 'package:rooms/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:rooms/features/home/domain/entities/home_entity.dart';
import 'package:rooms/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository{
  HomeRemoteDataSource homeRemoteDataSource;
  NetworkInfo networkInfo;

  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async{
    if(await networkInfo.isConnected){
      // var response=await SharedPrefs().getCachedHomeData();
      // if(response==HomeEntity){
      //   return Right(response);
      // }
    // else{
        try{
          var result=await homeRemoteDataSource.getHomeData();
          return Right(result);
        }on DioException{
          return Left(ServerFailure());
       // }
      }
    }else{
      return Left(ConnectionFailure());
    }

  }

  HomeRepositoryImp({
    required this.homeRemoteDataSource,
    required this.networkInfo,
  });
}