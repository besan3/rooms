import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rooms/core/index.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  bool isLast=false;
  PageController pageController=PageController();
  List<String>onBoardingImages=[
    AppImages.onBoarding1,
    AppImages.onBoarding2,
    AppImages.onBoarding3,
  ];
  List<String>onBoardingDescriptions=[
    AppTexts.onBoardDescription1,
    AppTexts.onBoardDescription2,
    AppTexts.onBoardDescription3,

  ];
  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<OnBoardingEvent>((event, emit) {
    if(event is OnBoardingNavigateEvent){
      if(event.index==onBoardingDescriptions.length-1){
        isLast=true;
        emit(OnBoardingNavigatedState());
      }else{
        emit(OnBoardingNavigateState());
      }
    }
    });
  }
}
