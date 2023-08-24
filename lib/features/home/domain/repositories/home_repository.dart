import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository{
  Future<Either<Failure,HomeEntity>>getHomeData();
}