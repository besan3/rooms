import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/auth/domain/entities/login_entity.dart';
import 'package:rooms/features/auth/domain/entities/profile_entity.dart';
import 'package:rooms/features/auth/domain/entities/register_entity.dart';
import 'package:rooms/features/auth/domain/entities/register_info.dart';

abstract class AuthRepository{
Future<Either<Failure,LoginEntity>>login(String email,String password);
Future<Either<Failure,RegisterEntity>>register(RegisterInfo registerInfo);
Future<Either<Failure,ProfileEntity>>getProfile();
Future<Either<Failure,ProfileEntity>>updateProfile(String firstName,String lastName,File image);
}