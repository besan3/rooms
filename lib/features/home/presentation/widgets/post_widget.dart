import 'package:rooms/core/index.dart';
import 'dart:math'as math;
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
  final String time;
   PostWidget({
    required this.roomImage, required this.post, required this.roomName, required this.time,  this.postImage, required this.comments, required this.likes, this.hasImage=true,this.hasBody=true, required this.creator
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(AppSizes.padding20.h.w),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(roomImage),
                  radius: AppSizes.radius26.r,
                  backgroundColor: AppColors.cardColor,
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
                    children: [
                      SizedBox(
                          width: 133.w,
                          child: Text(
                            creator,
                            style: Theme.of(context).primaryTextTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Text(time,
                      style: Theme.of(context).primaryTextTheme.bodySmall,

                      ),
                    ],
                  ),
                ]),
                Spacer(),
                SvgPicture.asset(AppIcons.menu)
              ],
            ),
          Container(
            width: 327.w,
           // height: 150.h,
            padding: EdgeInsets.all(AppSizes.padding12.h.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.shadeColor,
                width: 1.5.w
              ),
              borderRadius: BorderRadius.circular(AppSizes.radius8.r)
            ),
            child: Column(
              children: [
                 Row(
                    children: [
                     SizedBox(
                          width: 133.w,
                          child: Text(
                            post??'',
                            style: Theme.of(context).primaryTextTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      
                      Text(time,
                      style: Theme.of(context).primaryTextTheme.bodySmall,

                      ),
                    ]
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hasBody==true?SizedBox(
                        width: 170.w,
                        child: Text(post!,
                        style: Theme.of(context).primaryTextTheme.titleMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ):SizedBox(),
                     hasImage==true? SizedBox(
                          height: 90.h,
                          width: 90.w,

                          child: Image.network(postImage!)):SizedBox()
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
              SvgPicture.asset(AppIcons.message),
                  Text(comments.toString(),
                        style: Theme.of(context).primaryTextTheme.bodySmall,
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
      ),
    );
  }
}
