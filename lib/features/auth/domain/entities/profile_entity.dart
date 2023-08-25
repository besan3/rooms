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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
  return data;
  }
}
