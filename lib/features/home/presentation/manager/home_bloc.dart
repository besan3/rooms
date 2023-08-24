import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rooms/features/home/domain/entities/home_entity.dart';
import 'package:rooms/features/home/domain/use_cases/get_home_data_usecase.dart';
import 'package:rooms/features/home/presentation/pages/home_screen.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  HomeEntity homeEntity=HomeEntity(status: false, message: '');
  var result;
  List<Widget>screens=[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
   int index=0;
  HomeBloc({required this.getHomeDataUseCase}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit)async {
      if(event is NavigateToNewScreenEvent){
        index=event.currentIndex;
        emit(HomeNavigatedState(screen: screens[index]));
      }if(event is GetHomeDataEvent){
        emit(GetHomeDataLoadingState());
        var response=await getHomeDataUseCase.call();
        response.fold((l) => emit(GetHomeDataErrorState(message: l.toString())), (r) {
          homeEntity=r;
          emit(GetHomeDataSuccessState(homeEntity: homeEntity));
        });
      }
      if(event is LikeRoomEvent){
        if(state is DisLikedState){
          emit(LikedState());
        }else{
          emit(DisLikedState());
        }
      }
    });
  }


}
