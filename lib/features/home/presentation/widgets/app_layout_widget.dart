import 'package:rooms/core/index.dart';
import 'package:rooms/core/network/local_storage.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';

class AppLayout extends StatelessWidget {
var profileData=SharedPrefs.getDta(key: 'profile');

  @override
  Widget build(BuildContext context) {
    print(profileData);
    HomeBloc homeBloc=context.read<HomeBloc>();
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if(state is HomeInitial){
          homeBloc.add(GetHomeDataEvent());

        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius64.r)
            ) ,
            backgroundColor: Colors.black,
            onPressed: (){},
            child:Icon(Icons.add,color:AppColors.backgroundColor) ,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle:TextStyle(
              fontFamily:AppTexts.fontFamily,
              fontSize: AppSizes.fontSize14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily:AppTexts.fontFamily,
              fontSize: AppSizes.fontSize12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.hintColor,
            ),

            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.home,
              color:homeBloc.index==0?AppColors.primaryColor:AppColors.shadeColor,
              ),label: AppTexts.home,
              ),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.search,
              color:homeBloc.index==1?AppColors.primaryColor:AppColors.shadeColor,
              ),label: AppTexts.search,
              ),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.rooms,
              color:homeBloc.index==2?AppColors.primaryColor:AppColors.shadeColor,
              ),label: AppTexts.rooms,
              ),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.favorite,
              color:homeBloc.index==3?AppColors.primaryColor:AppColors.shadeColor,
              ),label: AppTexts.favorites,
              ),
            ],
            currentIndex: homeBloc.index,
            onTap: (index)=>homeBloc.add(NavigateToNewScreenEvent(currentIndex: index)),
          ) ,
          appBar: AppBar(
            title: Text(AppTexts.appName),
              leading:profileData!=null?  CircleAvatar(
              backgroundImage: ExactAssetImage(profileData.image),
            ):null,
            actions: [
              IconButton(onPressed: (){}, icon: SvgPicture.asset(AppIcons.notifications))
            ],
          ),

          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.padding20.h.w),
                child:homeBloc.screens[homeBloc.index],
              ),
            ),
          ),

        );
      },
    );
  }
}
