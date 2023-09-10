import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rooms/core/errors/exceptions.dart';
import 'package:rooms/core/index.dart';
import 'package:rooms/core/network/end_points.dart';
import 'package:rooms/core/network/local_storage.dart';
import 'package:rooms/features/home/data/models/comment_model.dart';
import 'package:rooms/features/home/data/models/home_models.dart';
import 'package:rooms/features/home/data/models/room_models.dart';
import 'package:rooms/features/home/data/models/search_model.dart';

abstract class HomeRemoteDataSource{
  Future<HomeModel> getHomeData();
  Future<RoomDetailsModel> getRoomData(int roomId);
  Future<SearchModel> getSearchResults(String key);
  Future<CommentModel> getPostComments(int post_id);
  Future<Unit> addRoom(String name,int is_private,File image);
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

  @override
  Future<RoomDetailsModel> getRoomData(int roomId)async {
    Response response=await dio.get('https://rooms.doos.info/api/rooms/show?room_id=$roomId');
    print(response);
    if(response.statusCode==200) {
      RoomDetailsModel roomDetailsModel = RoomDetailsModel.fromJson(response.data);
      return roomDetailsModel;
    }else{
      throw ServerException();
    }
  }

  @override
  Future<SearchModel> getSearchResults(String key) async{
    Response response=await dio.get('https://rooms.doos.info/api/rooms?keywords=$Key');
    print(response);
    if(response.statusCode==200) {
      SearchModel searchModel = SearchModel.fromJson(response.data);
      print(searchModel);

      return searchModel;
    }else{
      throw ServerException();
    }
  }

  @override
  Future<CommentModel> getPostComments(int post_id)async {

    Response response=await dio.get('https://rooms.doos.info/api/comments?post_id=$post_id',
        options: Options(
            headers: {
              'Authorization': 'Bearer ${SharedPrefs.token}'

            })
    );
    print(response);
    if(response.statusCode==200) {
      CommentModel commentModel = CommentModel.fromJson(response.data);
      print(commentModel);

      return commentModel;
    }else{
      throw ServerException();
    }
  }

  @override
  Future<Unit> addRoom(String name, int is_private,File image)async {
  Response response=await dio.post(EndPoints.addRoom,
  data: {
    'name': name,
    'is_private': is_private,
    //'image': await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
  }

  );
  print(response.data);
  if (response.statusCode == 200) {
    print('Room added successfully!');

    return response.data;
  } else {
    print('Failed to add the room. Status code: ${response.statusCode}');
    throw ServerException();
  }
  }

}