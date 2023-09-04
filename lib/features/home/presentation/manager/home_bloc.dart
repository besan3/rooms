import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/home/domain/entities/home_entity.dart';
import 'package:rooms/features/home/domain/use_cases/get_home_data_usecase.dart';
import 'package:rooms/features/home/domain/use_cases/get_room_details_usecase.dart';
import 'package:rooms/features/home/presentation/pages/home_screen.dart';
import 'package:rooms/features/home/presentation/pages/rooms_screen.dart';
import 'package:rooms/features/home/presentation/pages/search_screen.dart';

import '../../domain/entities/room_details_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  final GetRoomDateUseCase getRoomDateUseCase;
  HomeEntity homeEntity=HomeEntity(status: false, message: '');
  RoomDetailsEntity roomDetailsEntity=RoomDetailsEntity(status: false, message: '');
  var result;
  List<Widget>screens=[
    HomeScreen(),
    SearchScreen(),
    RoomsScreen(),
    HomeScreen(),
  ];
   int index=0;
  HomeBloc( {required this.getHomeDataUseCase,required this.getRoomDateUseCase,}) : super(HomeInitial(),) {
    on<HomeEvent>((event, emit)async {
      if(event is NavigateToNewScreenEvent){
        index=event.currentIndex;
        emit(HomeNavigatedState(screen: screens[index]));
      }if(event is GetHomeDataEvent){
        var response=await getHomeDataUseCase.call();
        response.fold((l) {
          String message;
          emit(GetHomeDataErrorState(message:l is ConnectionFailure?'Check Your Internet Connection': l.toString()));
        }, (r) {
          homeEntity=r;
          emit(GetHomeDataSuccessState(homeEntity: homeEntity));
        });
      }
      if(event is LikeRoomEvent){
        if(state is DisLikedState){
          index=event.index;
          emit(LikedState());
        }else{
          emit(DisLikedState());
        }
      }
      if(event is GetRoomDetailsEvent){

        var response=await getRoomDateUseCase.call(event.roomId);
        print(response);
        response.fold((l) => emit(GetRoomDataErrorState(message:l is ConnectionFailure?'Check Your Internet Connection': l.toString())), (r) {
          roomDetailsEntity=r;
          emit(GetRoomDataSuccessState(roomDetailsEntity: roomDetailsEntity));
        });

      }
    });
  }


}
