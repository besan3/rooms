import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rooms/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:rooms/features/auth/data/repositories/auth_repositoryImp.dart';
import 'package:rooms/features/auth/domain/repositories/auth_repository.dart';
import 'package:rooms/features/auth/domain/use_cases/get_profile_usecase.dart';
import 'package:rooms/features/auth/domain/use_cases/login_usecase.dart';
import 'package:rooms/features/auth/domain/use_cases/register-usecase.dart';
import 'package:rooms/features/auth/domain/use_cases/update_profile_usecase.dart';
import 'package:rooms/features/auth/presentation/manager/auth_bloc.dart';
import 'package:rooms/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:rooms/features/home/data/repositories/home_repositoryImp.dart';
import 'package:rooms/features/home/domain/repositories/home_repository.dart';
import 'package:rooms/features/home/domain/use_cases/get_home_data_usecase.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';
import 'network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {


// Bloc

  sl.registerFactory(() => AuthBloc(
      loginUseCase: sl(),registerUseCase: sl(),profileUseCase: sl(),updateProfileUseCase: sl()));

  sl.registerFactory(() => HomeBloc(getHomeDataUseCase: sl()));
// UseCases

  sl.registerLazySingleton(() => LoginUseCase( authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase( authRepository: sl()));
  sl.registerLazySingleton(() => GetProfileUseCase( authRepository: sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase( authRepository: sl()));
  sl.registerLazySingleton(() => GetHomeDataUseCase( homeRepository: sl()));


// Repository

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(
      authRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(
      homeRemoteDataSource: sl(), networkInfo: sl()));

// DataSources

  sl.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImp(dio: sl()));

  sl.registerLazySingleton<HomeRemoteDataSource>(
            () => HomeRemoteImp(dio: sl()));


//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp( connectionChecker: sl(),));

//! External


  final dio = Dio();
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}