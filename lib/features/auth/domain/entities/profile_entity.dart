import 'package:equatable/equatable.dart';
import 'package:rooms/features/auth/domain/entities/login_entity.dart';

class ProfileEntity extends Equatable{

  final bool status;
  final String message;
  final UserData? data;
  @override
  List<Object?> get props => [status, message, data];
  const ProfileEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}
