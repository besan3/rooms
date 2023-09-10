import 'package:rooms/core/index.dart';
import 'dart:math'as math;

import 'package:share_plus/share_plus.dart';
class PostWidget extends StatelessWidget {
   String? postImage;
   bool? hasImage;
   bool? hasBody;
  final String roomImage;
  final int comments;
  final int likes;
  final String? post;
  final String creator;
  final String roomName;
  final String? time;
   void Function()? onTap;
   void Function()? onTapImage;
   void Function()? onTapComment;
   PostWidget({
    required this.roomImage, required this.post, required this.roomName, this.time,  this.postImage, required this.comments, required this.likes, this.hasImage=true,this.hasBody=true, required this.creator,
 this.onTap,
     this.onTapImage,
     this.onTapComment
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radius15.r),

          color: Colors.white70
      ),
      padding: EdgeInsets.all(AppSizes.padding20.h.w),
      child: Column(
        
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(roomImage),
                  radius: AppSizes.radius26.r,
                  backgroundColor: AppColors.cardColor,
                ),
              ),
              SizedBox(
                width: AppSizes.padding8.w,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                Text(roomName,
                  style: Theme.of(context).primaryTextTheme.displaySmall,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    SizedBox(
                       // width: 133.w,
                        child: Text(
                          creator,
                          style: Theme.of(context).primaryTextTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),

                  ],
                ),
              ]),
              Spacer(),
             PopupMenuButton<int>(
                  icon:SvgPicture.asset(AppIcons.menu) ,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            SizedBox(
                              // sized box with width 10
                              width: 10,
                            ),
                            Text(AppTexts.hidePost),
                          ],
                        )
                    ),
                    // popupmenu item 2
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: ()=> Navigator.pushNamed(context, AppRoutes.editRoom),
                              child: Text( AppTexts.reportPost))
                        ],
                      ),
                    ),

                  ],
                  offset: Offset(0, 40),
                  color: AppColors.cardColor,
                  elevation: 0,surfaceTintColor:AppColors.cardColor ,
                ),

            ],
          ),
        Container(
          width: 327.w,
          padding: EdgeInsets.all(AppSizes.padding12.h.w),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.shadeColor,
              width: 1.5.w
            ),
            borderRadius: BorderRadius.circular(AppSizes.radius8.r)
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
               SizedBox(
                    width: 133.w,
                    child: Text(
                      post??'',
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hasBody==true?GestureDetector(
                      onTap: onTapImage,
                      child: SizedBox(
                        width: 170.w,
                        child: Text(post!,
                        style: Theme.of(context).primaryTextTheme.titleMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ):SizedBox(),
                   hasImage==true? GestureDetector(
                     onTap: onTapImage,
                     child: Container(

                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(AppSizes.radius8.r),
                         image: DecorationImage(
                           image: NetworkImage(postImage!,
                           ),
                          fit: BoxFit.cover,
                         )
                       ),
                          height: 90.h,
                          width: 90.w,
                        ),
                   ):SizedBox()
                  ],
                )
            ].addSeparator(separator: SizedBox(
              height: AppSizes.padding8.h,
            ))
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:AppSizes.padding12.w),
          child: Row(children: [
            SvgPicture.asset(AppIcons.arrow),
            Text(likes.toString(),
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                      ),
            Transform.rotate(
              angle:math.pi ,
              child: SvgPicture.asset(AppIcons.arrow)),
            Spacer(),
            GestureDetector(
                onTap: onTapComment,
                child: SvgPicture.asset(AppIcons.message)),
                GestureDetector(
                  onTap: onTapComment,
                  child: Text(comments.toString(),
                        style: Theme.of(context).primaryTextTheme.bodySmall,
                        ),
                ),
            Spacer(),
            SvgPicture.asset(AppIcons.share),
             Text(AppTexts.share,
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                      ),
          ],),
        )
        ].addSeparator(separator: SizedBox(
          height: AppSizes.padding8.h,
        ))
      ),
    );
  }
}
