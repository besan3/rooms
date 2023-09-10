import 'package:rooms/core/index.dart';
import 'package:rooms/core/network/local_storage.dart';
import 'package:rooms/features/auth/presentation/pages/edit_profile_screen.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';

class AppLayout extends StatelessWidget {
//var profileData=SharedPrefs.getDta(key:'profile');
var profileData=SharedPrefs.getDta(key:'profile');

  @override
  Widget build(BuildContext context) {
    print(profileData);

    HomeBloc homeBloc=context.read<HomeBloc>();
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {

        return Scaffold(
          resizeToAvoidBottomInset: false,
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
              BottomNavigationBarItem(icon: Icon(Icons.add,
                color:homeBloc.index==2?AppColors.primaryColor:AppColors.shadeColor,),

              label:AppTexts.addRoom,
              ),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.rooms,
              color:homeBloc.index==3?AppColors.primaryColor:AppColors.shadeColor,
              ),label: AppTexts.rooms,
              ),
              BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.favorite,
              color:homeBloc.index==4?AppColors.primaryColor:AppColors.shadeColor,
              ),label: AppTexts.favorites,
              ),
            ],
            currentIndex: homeBloc.index,
            onTap: (index)=>homeBloc.add(NavigateToNewScreenEvent(currentIndex: index)),
          ) ,
          appBar: AppBar(
            title: Text(AppTexts.appName),
              leading:profileData!=null?  Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>EditProfileScreen(profileEntity: profileData))),
                  child: CircleAvatar(
                    radius: AppSizes.radius8.r,
                  backgroundColor: AppColors.cardColor,
                  child: Image.network(profileData,width: 25.w,),
            ),
                ),
              ):null,
            actions: [
              IconButton(onPressed: (){}, icon: SvgPicture.asset(AppIcons.notifications))
            ],
          ),

          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.padding20.h.w),
              child:homeBloc.screens[homeBloc.index],
            ),
          ),

        );
      },
    );
  }
}
