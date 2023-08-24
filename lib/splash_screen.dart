import 'package:flutter/material.dart';
import 'package:rooms/core/app_images.dart';
import 'package:rooms/core/app_routes.dart';
import 'package:rooms/core/network/local_storage.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var isSaved= SharedPrefs.getDta( key: 'onBoarding');
  var isFirstLogin=SharedPrefs.getDta(key: 'token');
   print(isSaved);
   print(isFirstLogin);

    Future.delayed(const Duration(seconds: 5), (){
      Navigator.pushReplacementNamed(context,isSaved!=null?isFirstLogin==null? AppRoutes.login:AppRoutes.home:AppRoutes.onBoarding);
    });

    return Scaffold(
      body: Center(child: Image.asset(AppImages.logo),),
    );
  }
}