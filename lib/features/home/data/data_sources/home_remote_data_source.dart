import 'package:dio/dio.dart';
import 'package:rooms/core/errors/exceptions.dart';
import 'package:rooms/core/network/end_points.dart';
import 'package:rooms/core/network/local_storage.dart';
import 'package:rooms/features/home/data/models/home_models.dart';

abstract class HomeRemoteDataSource{
  Future<HomeModel> getHomeData();
}
class HomeRemoteImp implements HomeRemoteDataSource{
  final Dio dio;

  @override
  Future<HomeModel> getHomeData()async {
   Response response=await dio.get(EndPoints.home);
   if(response.statusCode==200) {
      HomeModel homeModel = HomeModel.fromJson(response.data);
      SharedPrefs().cacheHomeData(homeModel);
      return homeModel;
    }else{
     throw ServerException();
   }
  }
  const HomeRemoteImp({
    required this.dio,
  });
}