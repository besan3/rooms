import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/auth/domain/entities/profile_entity.dart';
import 'package:rooms/features/auth/domain/repositories/auth_repository.dart';

class UpdateProfileUseCase{
  final AuthRepository authRepository;

  const UpdateProfileUseCase({
    required this.authRepository,
  });
  Future<Either<Failure,ProfileEntity>>call(String firstName,String lastName,File image)async{
    return await authRepository.updateProfile(firstName, lastName, image);
  }
}