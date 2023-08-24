import 'package:flutter/material.dart';
import 'package:rooms/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:rooms/features/auth/presentation/pages/login_screen.dart';
import 'package:rooms/features/auth/presentation/pages/new_password_screen.dart';
import 'package:rooms/features/auth/presentation/pages/register_screen.dart';
import 'package:rooms/features/auth/presentation/pages/verification_code_screen.dart';
import 'package:rooms/features/home/presentation/widgets/app_layout_widget.dart';
import 'package:rooms/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:rooms/splash_screen.dart';


class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String forgetPassword = '/forgetPassword';
  static const String verification = '/verification';
  static const String newPassword = '/newPassword';
  static const String onBoarding = '/onBoarding';
  static const String home = '/home';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case verification:
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case newPassword:
        return MaterialPageRoute(builder: (_) => NewPasswordScreen());
      case home:
        return MaterialPageRoute(builder: (_) => AppLayout());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }

}
