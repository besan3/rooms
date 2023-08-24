import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rooms/core/app_colors.dart';
import 'package:rooms/core/app_sizes.dart';
import 'package:rooms/core/app_texts.dart';

abstract class AppThemes{
  static ThemeData lightTheme=ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor:Colors.black),
    primaryColor: Colors.black,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor:  AppColors.backgroundColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          fontFamily:AppTexts.fontFamily,
          fontSize: AppSizes.fontSize20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryColor
      )
    ),
    primaryTextTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily:AppTexts.fontFamily,
        fontSize: AppSizes.fontSize24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimaryColor
      ),
      titleMedium: TextStyle(
          fontFamily:AppTexts.fontFamily,
          fontSize: AppSizes.fontSize16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.subTitleColor,
      ),
      displayMedium: TextStyle(
          fontFamily:AppTexts.fontFamily,
          fontSize: AppSizes.fontSize18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.backgroundColor,
      ),
        displaySmall: TextStyle(
          fontFamily:AppTexts.fontFamily,
          fontSize: AppSizes.fontSize14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.hintColor,
      ),
      bodySmall:TextStyle(
        fontFamily:AppTexts.fontFamily,
        fontSize: AppSizes.fontSize8.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.hintColor,
      ),
    )
  ) ;
}