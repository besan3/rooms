import 'package:rooms/features/home/presentation/manager/home_bloc.dart';
import 'package:rooms/features/home/presentation/pages/room_details_screen.dart';
import 'package:rooms/features/home/presentation/widgets/post_widget.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../core/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc=context.read<HomeBloc>();

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if(state is GetHomeDataErrorState){
           Fluttertoast.showToast(msg: state.message, );
        }

        if(state is GetHomeDataSuccessState){
          homeBloc.homeEntity=state.homeEntity;
        }
        if(state is GetRoomDataSuccessState){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>RoomDetailsScreen(roomData: homeBloc.roomDetailsEntity)));
        }

      },
      builder: (context, state) {

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    elevation: 0,
                    color: AppColors.cardColor,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.padding12.w,
                            vertical: AppSizes.padding29.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 230.w,
                                child: RichText(
                                  text: TextSpan(
                                      text: AppTexts.joinSome,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .displaySmall
                                          ?.copyWith(
                                              color: AppColors.primaryColor),
                                      children: [
                                        TextSpan(
                                          text: AppTexts.exploreRooms,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .titleMedium,
                                        )
                                      ]),
                                ),
                              ),
                              Image.asset(
                                AppImages.house,
                              )
                            ]))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppTexts.recommended,
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                    Text(
                      AppTexts.viewAll,
                      style: Theme.of(context).primaryTextTheme.displaySmall,
                    ),
                  ],
                ),
               homeBloc.homeEntity.data==null?
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return  Shimmer(

                            child: Container(height: 255.h,width:174.w,child: Card(
                              color: AppColors.cardColor,
                            ),))
                        ;

                      },

                      separatorBuilder: (context, index) => SizedBox(
                        height: AppSizes.padding12.h,
                      ),
                      itemCount: 2),
                )
               :
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                          return  GestureDetector(
                            onTap:()=>homeBloc.add(GetRoomDetailsEvent(roomId: homeBloc.homeEntity.data!.posts!.data![index].room!.id)),
                            child: PostWidget(
                              hasImage:homeBloc.homeEntity.data!.posts!.data![index].image.isNotEmpty ,
                              roomImage: homeBloc.homeEntity.data!.posts!.data![index].room!.image,
                               post:  homeBloc.homeEntity.data!.posts!.data![index].body,
                                roomName: homeBloc.homeEntity.data!.posts!.data![index].room!.name,
                                 time: homeBloc.homeEntity.data!.posts!.data![index].createdAt,
                                  postImage:homeBloc.homeEntity.data!.posts!.data![index].image,
                                   comments: homeBloc.homeEntity.data!.posts!.data![index].commentsCount,
                                    likes: homeBloc.homeEntity.data!.posts!.data![index].commentsCount, creator:
                            homeBloc.homeEntity.data!.posts!.data![index].user!.name
                              ,))
                          ;

                        },

                      separatorBuilder: (context, index) => SizedBox(
                            height: AppSizes.padding20.h,
                          ),
                      itemCount:homeBloc.homeEntity.data!.posts!.data!.length),
                ),

              ].addSeparator(
                  separator: SizedBox(
                height: AppSizes.padding20.h,
              )));
        }

    );
  }
}
