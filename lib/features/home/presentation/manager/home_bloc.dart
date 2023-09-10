import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rooms/core/errors/fauilers.dart';
import 'package:rooms/features/home/data/models/search_model.dart';
import 'package:rooms/features/home/domain/entities/comment_entity.dart';
import 'package:rooms/features/home/domain/entities/home_entity.dart';
import 'package:rooms/features/home/domain/entities/search_entity.dart';
import 'package:rooms/features/home/domain/use_cases/add_room_usecase.dart';
import 'package:rooms/features/home/domain/use_cases/get_home_data_usecase.dart';
import 'package:rooms/features/home/domain/use_cases/get_post_comment_usecase.dart';
import 'package:rooms/features/home/domain/use_cases/get_room_details_usecase.dart';
import 'package:rooms/features/home/domain/use_cases/get_search_results_usecase.dart';
import 'package:rooms/features/home/presentation/pages/add_rooms_screen.dart';
import 'package:rooms/features/home/presentation/pages/home_screen.dart';
import 'package:rooms/features/home/presentation/pages/rooms_screen.dart';
import 'package:rooms/features/home/presentation/pages/search_screen.dart';

import '../../domain/entities/room_details_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  final GetRoomDateUseCase getRoomDateUseCase;
  final GetSearchResultUseCase getSearchResultUseCase;
  final GetPostCommentUseCase getPostCommentUseCase;
  final AddRoomUseCase addRoomUseCase;
  HomeEntity homeEntity=HomeEntity(status: false, message: '');
  RoomDetailsEntity roomDetailsEntity=RoomDetailsEntity(status: false, message: '');
  SearchEntity searchResult=SearchEntity(status: false, message: '',data: SearchData(
data: []
  ));
   SearchModel searchModel=SearchModel(status: false, message: '', data: SearchDataModel(data: []

   ));
bool isSwitch=false;
  Comment comment=Comment(status: false, message: '');
  var result;
  List<Widget>screens=[
    HomeScreen(),
    SearchScreen(),
    AddRoomScreen(),
    RoomsScreen(),
    HomeScreen(),
  ];
   int index=0;
  HomeBloc( {required this.getHomeDataUseCase,required this.addRoomUseCase, required this.getRoomDateUseCase,required this.getSearchResultUseCase,required this.getPostCommentUseCase}) : super(HomeInitial(),) {
    on<HomeEvent>((event, emit)async {
      if(event is NavigateToNewScreenEvent){
        index=event.currentIndex;
        emit(HomeNavigatedState(screen: screens[index]));
      }if(event is GetHomeDataEvent){
        var response=await getHomeDataUseCase.call();
        response.fold((l) {
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
      if(event is GetSearchResultEvent){
        emit(GetSearchResultLoadingState());
        Dio dio=Dio();
        Response response=await dio.get('https://rooms.doos.info/api/rooms?keywords=${event.key}');
        print(response);
        if(response.data['status']==true) {
          result=response.data;

          emit(GetSearchResultSuccessState());

        }else{
          emit(GetSearchResultErrorState(message: response.data['message']));
        }
        // var result=await getSearchResultUseCase.call(event.key);
        // return result.fold((l) => emit(GetSearchResultErrorState(message:l is ConnectionFailure?'Check Your Internet Connection': l.toString())), (r) {
        //   searchResult=r;
        //   emit(GetSearchResultSuccessState(searchResult: searchResult));
        //
        // });
      }
      if(event is PickImageEvent){
       XFile? pickedImage= await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxWidth: 1800,
          maxHeight: 1800,
        );
       if (pickedImage != null) {
         File imageFile = File(pickedImage.path);

         emit(PickedImageState(image: imageFile));
       }
      }
      if(event is SwitchEvent){
          state is SwitchOn?emit(SwitchOff()):emit(SwitchOn());

      }
      if(event is GetPostCommentsEvent){
        //emit(GetPostCommentLoadingState());
        var comments=await getPostCommentUseCase.call(event.post_id);
        return comments.fold((l) => emit(GetPostCommentErrorState(message: l.toString())), (r) {

          comment=r;
        return  emit(GetPostCommentSuccessState(comment: comment));
        });
      }
      if(event is AddRoomEvent){
        var result=await addRoomUseCase.call(event.name, event.is_private, event.image);
        print(result);
        return result.fold((l) => emit(AddRoomErrorState(message: l.toString())), (r) => emit(AddRoomSuccessState()));
      }
    });
  }


}
