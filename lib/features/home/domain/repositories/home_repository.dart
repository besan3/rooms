import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/home/domain/entities/comment_entity.dart';
import 'package:rooms/features/home/domain/entities/home_entity.dart';
import 'package:rooms/features/home/domain/entities/room_details_entity.dart';
import 'package:rooms/features/home/domain/entities/search_entity.dart';

abstract class HomeRepository{
  Future<Either<Failure,HomeEntity>>getHomeData();
  Future<Either<Failure,RoomDetailsEntity>>getRoomData(int roomId);
  Future<Either<Failure,SearchEntity>>getSearchResults(String key);
  Future<Either<Failure,Comment>>getPostComments(int post_id);
  Future<Either<Failure,Unit>>addRoom(String name,int is_private,File image);
}