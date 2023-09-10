import 'package:readmore/readmore.dart';
import 'package:rooms/core/index.dart';
import 'dart:math'as math;

class ViewPostScreen extends StatelessWidget {
  final  postDetails;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:  Colors.black,
        iconTheme: IconThemeData(
          color: AppColors.backgroundColor,
        ),
        actions: [
          PopupMenuButton<int>(
            icon:SvgPicture.asset(AppIcons.menu,color: AppColors.backgroundColor,) ,
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
          ),        ],
      ),
      body: Padding(
        padding:EdgeInsets.all(AppSizes.padding20.w),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            Center(child: Image.network(postDetails.image)),
            Spacer(),
            Spacer(),

            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      //width: 150.w,
                      child:ReadMoreText(
                        postDetails.body,
                        style: Theme.of(context).primaryTextTheme.displayMedium,
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height:10),


                ],
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(AppIcons.arrow,color: AppColors.backgroundColor,),
                Text(postDetails.commentsCount.toString(),
                  style: Theme.of(context).primaryTextTheme.displayMedium,
                ),
                Transform.rotate(
                    angle:math.pi ,
                    child: SvgPicture.asset(AppIcons.arrow,color: AppColors.backgroundColor,)),
                Spacer(),
                SvgPicture.asset(AppIcons.message,color: AppColors.backgroundColor,),
                Spacer(),


                SvgPicture.asset(AppIcons.share,color: AppColors.backgroundColor,),

              ],),
          ].addSeparator(
              separator: SizedBox(
                height: AppSizes.padding20.h,
              ))
        ),
      ),

    );
  }

  const ViewPostScreen({
    required this.postDetails,
  });
}
