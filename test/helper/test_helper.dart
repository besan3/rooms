import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:rooms/features/auth/domain/repositories/auth_repository.dart';

@GenerateMocks(
    [
      AuthRepository
    ],
    customMocks: [MockSpec<Dio>(as: #MockDio)]
)

void main() {

}