import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/auth/domain/entities/register_entity.dart';
import 'package:rooms/features/auth/domain/repositories/auth_repository.dart';
import 'package:rooms/features/auth/domain/entities/register_info.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  const RegisterUseCase({
    required this.authRepository,
  });
  Future<Either<Failure,RegisterEntity>>call(RegisterInfo registerInfo)async{
    return await authRepository.register(registerInfo);
  }

}