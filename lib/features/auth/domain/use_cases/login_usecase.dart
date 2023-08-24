import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/auth/domain/entities/login_entity.dart';
import 'package:rooms/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  const LoginUseCase({
    required this.authRepository,
  });
  Future<Either<Failure,LoginEntity>>call(String email,String password)async{
    return await authRepository.login(email, password);
  }
}