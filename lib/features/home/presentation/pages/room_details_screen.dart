import 'package:rooms/core/index.dart';
import 'package:rooms/features/home/domain/entities/room_details_entity.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';
import 'package:rooms/features/home/presentation/widgets/post_widget.dart';
import 'package:share_plus/share_plus.dart';
class RoomDetailsScreen extends StatelessWidget {
 final RoomDetailsEntity roomData;

  RoomDetailsScreen({required this.roomData});

  @override
  Widget build(BuildContext context) {
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
                                child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: AppColors.cardColor),padding: EdgeInsets.zero)),
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
                                    // row has two child icon and text.
                                    child: TextButton.icon(

                                        onPressed: (){
                                          Navigator.pushNamed(context, AppRoutes.editRoom);
                                        },
                                        icon: Icon(Icons.edit),style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                        EdgeInsets.zero
                                      ),
                                      iconColor: MaterialStatePropertyAll(
                                        AppColors.primaryColor
                                      ),
                                      textStyle:MaterialStatePropertyAll(
                                        Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                                          color: Colors.black
                                        ),
                                      )
                                    ),
                                        label:  Text(AppTexts.editRoom)),
                                  ),
                                  // popupmenu item 2
                                  PopupMenuItem(
                                    value: 2,
                                    // row has two child icon and text
                                    child: Row(
                                      children: [
                                        Icon(Icons.chrome_reader_mode),
                                        SizedBox(
                                          // sized box with width 10
                                          width: 10,
                                        ),
                                        Text("About")
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
                        children: [
                          Text(roomData.data!.name!+" / "+roomData.data!.administrator!.name,
                            style: Theme.of(context).primaryTextTheme.bodyMedium,
                          ),

                          Text(roomData.data!.participants!.length.toString()+' Participants',
                            style: Theme.of(context).primaryTextTheme.displaySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding:EdgeInsets.symmetric(horizontal: AppSizes.padding20.w),
                  child: Text('Room Posts',
                  style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                ),
                roomData.data==null||roomData.data!.posts!.length==0?Center(
                    child: Text('No Posts yet',  style: Theme.of(context).primaryTextTheme.displaySmall,)):Expanded(child:
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: AppSizes.padding20.w),
                  child: ListView.separated(
                    itemBuilder:(context,index)=>PostWidget(
                        hasImage:roomData.data!.posts![index].image?.isNotEmpty ,
                      roomImage:roomData.data!.image!,
                       postImage:roomData.data!.posts![index].image ,
                       post: roomData.data!.posts![index].body,
                        roomName: roomData.data!.name!,
                         time: roomData.data!.createdAt??'',
                          comments: roomData.data!.posts![index].comments!.length,
                          likes: roomData.data!.posts![index].comments!.length,
                          creator:roomData.data!.administrator!.name
                          ), separatorBuilder: (context, index) => SizedBox(height: AppSizes.padding20.h,), itemCount: roomData.data!.posts!.length),
                ))

              ].addSeparator(separator: SizedBox(height: AppSizes.padding20.h,))
            ),
          )
        );
      },
    );
  }
}
