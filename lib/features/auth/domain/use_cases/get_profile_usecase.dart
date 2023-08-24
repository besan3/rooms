import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/auth/domain/entities/profile_entity.dart';
import 'package:rooms/features/auth/domain/repositories/auth_repository.dart';

class GetProfileUseCase{
  final AuthRepository authRepository;

  const GetProfileUseCase({
    required this.authRepository,
  });
  Future<Either<Failure,ProfileEntity>>call()async{
    return await authRepository.getProfile();
  }
}