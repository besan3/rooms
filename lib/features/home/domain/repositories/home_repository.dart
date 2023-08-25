import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/home/domain/entities/home_entity.dart';
import 'package:rooms/features/home/domain/entities/room_details_entity.dart';

abstract class HomeRepository{
  Future<Either<Failure,HomeEntity>>getHomeData();
  Future<Either<Failure,RoomDetailsEntity>>getRoomData(int roomId);
}