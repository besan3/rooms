import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/home/domain/entities/room_details_entity.dart';
import 'package:rooms/features/home/domain/repositories/home_repository.dart';

class GetRoomDateUseCase{
  final HomeRepository homeRepository;
  Future<Either<Failure,RoomDetailsEntity>>call(int roomId)async{
    return await homeRepository.getRoomData(roomId);
  }

  const GetRoomDateUseCase({
    required this.homeRepository,
  });
}