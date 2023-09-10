import 'package:dio/dio.dart';
import 'package:rooms/core/index.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';
import 'package:rooms/features/home/presentation/pages/room_details_screen.dart';
import 'dart:async';

class SearchScreen extends StatelessWidget {
final TextEditingController searchRoomController=TextEditingController();
final TextEditingController searchPeopleController=TextEditingController();
Timer? _debounce;
var result;
  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc=context.read<HomeBloc>();

    return   BlocConsumer<HomeBloc, HomeState>(
  listener: (context, state) {
    if(state is GetSearchResultErrorState){
      Fluttertoast.showToast(msg: state.message, textColor: Colors.white);
    }
if(state is GetRoomDataSuccessState){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              RoomDetailsScreen(roomData: homeBloc.roomDetailsEntity)));
}
  },
  builder: (context, state) {
    return DefaultTabController(
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
                  text: AppTexts.rooms,
                ),
                Tab(
                  text: AppTexts.people,
                ),

              ],

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:AppSizes.padding20.w),
              child: SizedBox(
                height: 300,
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height:55.h,
                          child: SearchBar(
                          elevation:MaterialStatePropertyAll(
                            0
                          ),hintText: AppTexts.search,hintStyle:MaterialStatePropertyAll(
                              Theme.of(context).primaryTextTheme.displaySmall
                          ),
                    controller: searchRoomController,
                    onChanged: (value)async{


                              homeBloc.emit(GetSearchResultLoadingState());
                              Dio dio=Dio();
                              Response response=await dio.get('https://rooms.doos.info/api/rooms?keywords=${value}');
                              result=response.data;
                              homeBloc.emit(GetSearchResultSuccessState());
                              print(response);

                 //  _debounce?.cancel();

                    },
                  leading: Icon(Icons.search,
                            color:AppColors.hintColor
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                              AppColors.cardColor
                            ),
                          ),
                        ),
                        result==null?SizedBox():
                        state is GetSearchResultLoadingState?
                      //  searchModel.data.data.isEmpty?SizedBox(): searchModel.data!.data!.length==0?Text('No Results'):
                      CircularProgressIndicator():
                        result['data']['data'].length==0?Text('No results found'):   Expanded(
                          child: ListView.separated(
                            itemBuilder: (context,index) =>  GestureDetector(
                              onTap: ()=>homeBloc.add(GetRoomDetailsEvent(roomId: result['data']['data'][index]['id'])),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppSizes.radius8.r),
                                  color: AppColors.cardColor,
                                ),
                                padding: EdgeInsets.all(AppSizes.padding20.w.h),
                                child: Row(
                                  children: [
                                    CircleAvatar(

                                      backgroundImage: NetworkImage(result['data']['data'][index]['image']),
                                    backgroundColor: AppColors.cardColor,
                                      radius: AppSizes.radius15.r,
                                    ),
                                    Text(" "+result['data']['data'][index]['name'],
                                    style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                                      fontSize: AppSizes.fontSize16.sp,
                                      fontWeight: FontWeight.w500
                                    ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            shrinkWrap: true,
                            itemCount:result['data']['data'].length, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: AppSizes.padding12.h,); },

                          ),
                        )

                      ].addSeparator(separator: SizedBox(height: AppSizes.padding12.h,))


                    ),
                    Column(
                      children: [
                        SizedBox(
                          height:55.h,
                          child: SearchBar(
                            elevation:MaterialStatePropertyAll(
                                0
                            ),
                            controller: searchPeopleController,
                            leading: Icon(Icons.search,
                                color:AppColors.hintColor
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.cardColor
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ].addSeparator(
              separator: SizedBox(
                height: AppSizes.padding20.h,
              ))


      ),
    );
  },
);
  }
}
