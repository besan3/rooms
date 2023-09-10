import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/home/domain/repositories/home_repository.dart';

class AddRoomUseCase{
  final HomeRepository homeRepository;
  Future<Either<Failure,Unit>>call(String name,int is_private,File image)async{
    return await homeRepository.addRoom(name, is_private, image);
  }

  const AddRoomUseCase({
    required this.homeRepository,
  });
}