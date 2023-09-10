import 'package:rooms/core/index.dart';
import 'package:rooms/core/network/local_storage.dart';
import 'package:rooms/features/home/domain/entities/room_details_entity.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';
import 'package:rooms/features/home/presentation/widgets/post_widget.dart';
import 'package:share_plus/share_plus.dart';
class RoomDetailsScreen extends StatelessWidget {
 final RoomDetailsEntity roomData;
  RoomDetailsScreen({required this.roomData});

  @override
  Widget build(BuildContext context) {
    bool isAdmin=SharedPrefs.getDta( key: 'id',)!=null&&SharedPrefs.getDta( key: 'id',)==roomData.data!.administrator!.id;

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(

          body:SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150.h,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.cardColor
                          )
                        ),
                        image: DecorationImage(
                        image: NetworkImage(roomData.data!.image!),fit: BoxFit.fill
                      ),
                    ),
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: AppSizes.padding16.w,vertical: AppSizes.padding8.h),
                      child: Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: AppColors.shadeColor,
                                child: IconButton(onPressed: (){
                                  Navigator.popAndPushNamed(context, AppRoutes.home);
                                  }, icon: Icon(Icons.arrow_back,color: AppColors.cardColor),padding: EdgeInsets.zero)),
                            Spacer(),
                            CircleAvatar(
                                backgroundColor: AppColors.shadeColor,

                                child: IconButton(onPressed: (){
                                  Share.share('check out my website https://example.com');
                                }, icon: SvgPicture.asset(AppIcons.share,color: AppColors.cardColor,),padding: EdgeInsets.zero)),

                            SizedBox(width: AppSizes.padding8.w,),
                            CircleAvatar(
                  backgroundColor: AppColors.shadeColor,
                  child: PopupMenuButton<int>(

                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          // sized box with width 10
                                          width: 10,
                                        ),
                                        Text(AppTexts.shareRoom),
                                      ],
                                    )
                                  ),
                                  // popupmenu item 2
                               PopupMenuItem(
                                    value: 2,
                                    child: Row(
                                      children: [

                                        SizedBox(
                                          // sized box with width 10
                                          width: 10,
                                        ),
                                       GestureDetector(
                                            onTap: ()=> Navigator.pushNamed(context, AppRoutes.editRoom),
                                            child: Text( isAdmin? AppTexts.editRoom:AppTexts.reportRoom))
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    // row has two child icon and text
                                    child: Row(
                                      children: [

                                        SizedBox(
                                          // sized box with width 10
                                          width: 10,
                                        ),
                                        isAdmin? Text(AppTexts.deleteRoom):SizedBox()
                                      ],
                                    ),
                                  ),
                                ],
                                offset: Offset(0, 40),
                                color: AppColors.cardColor,
                                elevation: 0,surfaceTintColor:AppColors.cardColor ,
                              ),
                ),                        ],
                        ),
                    ),
                    
                  ],
                ),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: AppSizes.padding20.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(roomData.data!.image!),
                        backgroundColor: AppColors.cardColor,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(roomData.data!.name!+" / "+roomData.data!.administrator!.name,
                            style: Theme.of(context).primaryTextTheme.bodyMedium,
                          ),

                          Text(roomData.data!.participants!.length.toString()+' Participants',
                            style: Theme.of(context).primaryTextTheme.displaySmall,
                          ),
                        ],
                      ),
                    Spacer(),
                     isAdmin?SizedBox(): ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor)
                        ),
                         onPressed: (){
                          print(SharedPrefs.getDta( key: 'id',));
                         }, child: Text(AppTexts.join,style:Theme.of(context).primaryTextTheme.displayMedium ,))
                    ],
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
                roomData.data==null||roomData.data!.posts!.length==0?Center(
                    child: Text('No Posts yet',  style: Theme.of(context).primaryTextTheme.displaySmall,)):Expanded(child:
                ListView.separated(
                  itemBuilder:(context,index)=>PostWidget(
                      hasImage:roomData.data!.posts![index].image?.isNotEmpty ,
                    roomImage:roomData.data!.image!,
                     postImage:roomData.data!.posts![index].image ,
                     post: roomData.data!.posts![index].body,
                      roomName: roomData.data!.name!,
                      // time: '12',
                        comments: roomData.data!.posts![index].comments!.length,
                        likes: roomData.data!.posts![index].comments!.length,
                        creator:roomData.data!.administrator!.name
                        ), separatorBuilder: (context, index) => Container(
                  color: AppColors.cardColor,
                  height: AppSizes.padding12.h,
                ), itemCount: roomData.data!.posts!.length))

              ].addSeparator(separator: SizedBox(height: AppSizes.padding20.h,))
            ),
          )
        );
      },
    );
  }
}
