import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/auth/domain/entities/login_entity.dart';
import 'package:rooms/features/auth/domain/use_cases/login_usecase.dart';

import '../../helper/test_helper.mocks.dart';

void main(){
  late LoginUseCase logInUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(()
  {
    mockAuthRepository=MockAuthRepository();
    logInUseCase=LoginUseCase(authRepository: mockAuthRepository);
  });
  //test cases

  test(
      'Test Login success',
          ()async{
        const loginEntity=  LoginEntity(
            status: false,
            message: '',
            token_type: '',
            expires_in: '',
            access_token: '',
            data: UserData(
                name: '',
                id: 0,
                image: '',
                email: '',
                first_name: '',
                last_name: ''
            ));
        when(mockAuthRepository.login('email', 'password')).thenAnswer(
                (_) async =>  Right(loginEntity));

        final result=await logInUseCase.call('email', 'password');
        verify(mockAuthRepository.login('email', 'password')).called(1);
        expect(result, Right(loginEntity));

      }
  );

  test('Test login failure',
          () async {
        // Define the behavior of the mockAuthRepository when logIn is called
        final failure = ServerFailure(/* failure data here */);
        when(mockAuthRepository.login('email', 'password')).thenAnswer((_) async => Left(failure));

        // Call the login method of logInUseCase
        final result = await logInUseCase('email', 'password');

        // Verify that the correct method was called on the mockAuthRepository
        verify(mockAuthRepository.login('email', 'password')).called(1);

        // Check the result
        expect(result, Left(failure));
      });
}