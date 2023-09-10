import 'package:rooms/features/home/domain/entities/home_entity.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';
import 'package:rooms/features/home/presentation/pages/comment_screen.dart';
import 'package:rooms/features/home/presentation/pages/room_details_screen.dart';
import 'package:rooms/features/home/presentation/pages/view_post_screen.dart';
import 'package:rooms/features/home/presentation/widgets/post_widget.dart';
import 'package:rooms/features/home/presentation/widgets/shimmer_post_widget.dart';
import '../../../../core/index.dart';

class HomeScreen extends StatelessWidget {
  late final PostDetailEntity post;
  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = context.read<HomeBloc>();
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      if (state is GetHomeDataErrorState) {
        Fluttertoast.showToast(
          msg: state.message,
        );
      }
      if (state is GetHomeDataSuccessState) {
        homeBloc.homeEntity = state.homeEntity;
      }
      if (state is GetRoomDataSuccessState) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RoomDetailsScreen(roomData: homeBloc.roomDetailsEntity)));
      }
      if (state is GetPostCommentSuccessState) {
        showModalBottomSheet(
            context: context,
          enableDrag: true,
          backgroundColor: AppColors.cardColor,
          elevation: 0.5,isScrollControlled: true,constraints: BoxConstraints.expand(),useSafeArea: true,
          builder:  (context) =>Container(
            width: double.infinity,
            height: 680.h,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radius8.r),
            ),
            padding: EdgeInsets.all(AppSizes.padding20.w.h),
            child:homeBloc.comment.data==null?Center(child: CircularProgressIndicator()): homeBloc.comment.data!.data.length==0?
            Center(child: Column(
              children: [
                Spacer(),
                Center(child: Text('No Comments yet')),
                Spacer(),
                Spacer(),
                CustomAppTextField(controller: TextEditingController(),
                    isSecure: false, hintText: AppTexts.writeComment, textInputType: TextInputType.text)
              ],
            )): Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.shadeColor,
                          child: Icon(Icons.person),
                        ),
                        Text(" "+homeBloc.comment.data!.data[0].post.user.name,
                          style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: AppSizes.fontSize14.sp
                          ),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding:EdgeInsets.only(left: 50.0),
                      child: Text(homeBloc.comment.data!.data[0].body,
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  Spacer(),
                  CustomAppTextField(controller: TextEditingController(), isSecure: false, hintText: AppTexts.writeComment, textInputType: TextInputType.text)
                ].addSeparator(separator: SizedBox(height: AppSizes.padding20.h,))
            ),
          )
        );


      }
    }, builder: (context, state) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding20.w),
              child: Card(
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    4,
                    (index) => Text(
                          AppTexts.taps[index],
                          style: index == 1
                              ? Theme.of(context).primaryTextTheme.titleMedium
                              : Theme.of(context).primaryTextTheme.displaySmall,
                        )),
              ),
            ),
            Container(
              height: 48.h,
              color: AppColors.cardColor,
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppTexts.bestPosts,
                    style: Theme.of(context).primaryTextTheme.displaySmall,
                  ),
                  Text(
                    AppTexts.viewAll,
                    style: Theme.of(context).primaryTextTheme.displaySmall,
                  ),
                ],
              ),
            ),
            homeBloc.homeEntity.data == null
                ? Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ShimmerPostWidget();
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: AppSizes.padding12.h,
                            ),
                        itemCount: 2),
                  )
                : Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return PostWidget(
                            onTapImage: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewPostScreen(
                                        postDetails: homeBloc.homeEntity.data!
                                            .posts!.data![index]))),
                            onTap: () => homeBloc.add(GetRoomDetailsEvent(
                                roomId: homeBloc.homeEntity.data!.posts!
                                    .data![index].room!.id)),
                            onTapComment: ()  {

                             print(homeBloc.comment);
                              homeBloc.add(GetPostCommentsEvent(
                                  post_id: homeBloc.homeEntity.data!.posts!
                                      .data![index].id));

                            },
                            hasImage: homeBloc.homeEntity.data!.posts!
                                .data![index].image.isNotEmpty,
                            roomImage: homeBloc.homeEntity.data!.posts!
                                .data![index].room!.image,
                            post: homeBloc
                                .homeEntity.data!.posts!.data![index].body,
                            roomName: homeBloc.homeEntity.data!.posts!
                                .data![index].room!.name,
                            time:homeBloc
                                .homeEntity.data!.posts!.data![index].createdAt,
                            postImage: homeBloc
                                .homeEntity.data!.posts!.data![index].image,
                            comments: homeBloc.homeEntity.data!.posts!
                                .data![index].commentsCount,
                            likes: homeBloc.homeEntity.data!.posts!.data![index]
                                .commentsCount,
                            creator: homeBloc.homeEntity.data!.posts!
                                .data![index].user!.name,
                          );
                        },
                        separatorBuilder: (context, index) => Container(
                              color: AppColors.cardColor,
                              height: AppSizes.padding12.h,
                            ),
                        itemCount:
                            homeBloc.homeEntity.data!.posts!.data!.length),
                  ),
          ].addSeparator(
              separator: SizedBox(
            height: AppSizes.padding20.h,
          )));
    });
  }
}
