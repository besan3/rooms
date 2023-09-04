import '../../../../core/index.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.primaryColor,
                  labelColor:AppColors.primaryColor,
                  labelStyle: Theme.of(context).primaryTextTheme.titleMedium,
                  unselectedLabelStyle:Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    color: AppColors.hintColor,
                    fontWeight: FontWeight.w500
                  ) ,
                  tabs: [
                    Tab(
                      text: AppTexts.myRooms,
                    ),
                    Tab(
                      text: AppTexts.roomsIamIn,
                    ),

                  ],
            
              ),
              SizedBox(
                height: 300,
                child: TabBarView(
                  children: [
                    Center(
                      child: Text( AppTexts.myRooms),
                    ),
                    Center(
                      child: Text(AppTexts.roomsIamIn),
                    ),

                  ],
                ),
              ),
            ].addSeparator(
                separator: SizedBox(
                  height: AppSizes.padding20.h,
                ))


          ),
        )
    ;
  }
}
