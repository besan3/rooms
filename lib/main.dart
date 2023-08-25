import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rooms/core/app_routes.dart';
import 'package:rooms/core/app_themes.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';
import 'package:rooms/features/on_boarding/presentation/manager/on_boarding_bloc.dart';
import 'package:rooms/core/injection_container.dart' as di;
import 'package:rooms/core/app_sizes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/local_storage.dart';
import 'features/auth/presentation/manager/auth_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await SharedPrefs().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(AppSizes.screenWidth, AppSizes.screenHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => di.sl<AuthBloc>(),
              ),
              BlocProvider(
                create: (context) => OnBoardingBloc(),
              ),
              BlocProvider(
                create: (context) => di.sl<HomeBloc>()..add(GetHomeDataEvent()),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              initialRoute: AppRoutes.splash,

              onGenerateRoute: AppRoutes.generateRoute,

            ),
          );
        }
    );
  }
}


