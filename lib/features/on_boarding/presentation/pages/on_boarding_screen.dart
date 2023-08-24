import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rooms/core/app_routes.dart';
import 'package:rooms/core/app_widgets.dart';
import 'package:rooms/core/network/local_storage.dart';
import 'package:rooms/core/index.dart';
import 'package:rooms/features/on_boarding/presentation/manager/on_boarding_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingBloc bloc=BlocProvider.of<OnBoardingBloc>(context);
    void submit() {
      SharedPrefs.saveData(key: 'onBoarding', value: true).then(((value) {
        if (value = true) {
          Navigator.pushReplacementNamed(context, AppRoutes.login);

        }
      }));
    }
    return BlocConsumer<OnBoardingBloc, OnBoardingState>(
          listener: (context, state) {

          },
  builder: (context, state) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                     submit();
                    },
                    child: Text(AppTexts.skip))
              ],
            ),
            body:  SafeArea(
              child: Padding(
                padding:  EdgeInsets.all(AppSizes.padding20.h.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Expanded(
                      child: PageView.builder(
                          itemCount: bloc.onBoardingDescriptions.length,
                          controller: bloc.pageController,
                          onPageChanged: (index)=>bloc.add(OnBoardingNavigateEvent(index: index)),
                          itemBuilder: (context,index)=>
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(bloc.onBoardingImages[index],
                                      width:205.w,
                                      height:205.w,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(AppImages.logo,
                                          width:35.w,
                                          height:35.w,
                                        ),
                                        Text(AppTexts.appName,
                                          style: Theme.of(context).primaryTextTheme.titleLarge,
                                        )
                                      ],
                                    ),
                                    Text(bloc.onBoardingDescriptions[index],
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).primaryTextTheme.titleMedium,
                                    ),



                                  ].addSeparator(
                                      separator:SizedBox(
                                        height: AppSizes.padding29.h,
                                      )
                                  )
                              )

                      ),

                    ),
                    SmoothPageIndicator(
                      count: bloc.onBoardingDescriptions.length,
                      controller: bloc.pageController,
                      effect: WormEffect(
                          activeDotColor: AppColors.primaryColor,
                          dotHeight: 10.h,
                          dotWidth: 10.w,
                          spacing: 11.w),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: AppSizes.padding20.h),
                      child: CustomAppButton(
                          isText: true,
                          text: AppTexts.next,onPressed:(){
                        if(state is OnBoardingNavigatedState){
                          Navigator.pushReplacementNamed(context, AppRoutes.login);
                          submit();
                        }else{
                          bloc.pageController.nextPage(duration: Duration(microseconds: 500), curve: Curves.bounceInOut);
                        }
                      }),
                    ),

                  ]
                ),
              ),
            )
    );
  },
);
  }
}
