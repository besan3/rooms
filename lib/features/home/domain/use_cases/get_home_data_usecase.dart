import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/home/domain/entities/home_entity.dart';
import 'package:rooms/features/home/domain/repositories/home_repository.dart';

class GetHomeDataUseCase{
  final HomeRepository homeRepository;

  const GetHomeDataUseCase({
    required this.homeRepository,
  });
  Future<Either<Failure,HomeEntity>>call()async{
    return await homeRepository.getHomeData();
  }
}