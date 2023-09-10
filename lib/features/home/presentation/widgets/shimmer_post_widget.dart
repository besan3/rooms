import 'package:rooms/core/index.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerPostWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radius15.r),

          color: Colors.white70
      ),
      padding: EdgeInsets.all(AppSizes.padding20.h.w),
      child: Shimmer.fromColors(enabled: true,
          baseColor: AppColors.cardColor ,
       highlightColor : Colors.white70,

        child: Column(

            children: [
              Row(
                children: [
                  CircleAvatar(

                    radius: AppSizes.radius26.r,
                    backgroundColor: AppColors.cardColor,
                  ),
                  SizedBox(
                    width: AppSizes.padding8.w,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: AppSizes.padding8.h,
                          width: 100.w ,
                          color: AppColors.cardColor,
                        ),
                        SizedBox(
                          height: AppSizes.padding8.w,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 133.w,
                                child:  Container(
                                  height: AppSizes.padding8.h,
                                  width: AppSizes.padding12.w,
                                  color: AppColors.cardColor,
                                ),),
                            Container(
                              height: AppSizes.padding8.h,
                              width: AppSizes.padding12.w ,
                              color: AppColors.cardColor,
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
               height: 150.h,
                padding: EdgeInsets.all(AppSizes.padding12.h.w),
                decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(AppSizes.radius8.r)
                ),
                child: Column(
                    children: [
                      Row(
                          children: [
                            SizedBox(
                                width: 133.w,
                                child:   Container(
                                  height: AppSizes.padding8.h,
                                  width: AppSizes.padding12.w ,
                                  color: AppColors.cardColor,
                                ),),
                            Container(
                              height: AppSizes.padding8.h,
                              width: AppSizes.padding12.w ,
                              color: AppColors.cardColor,
                            ),
                          ]
                      ),


                    ].addSeparator(separator: SizedBox(
                      height: AppSizes.padding8.h,
                    ))
                ),
              ),

            ].addSeparator(separator: SizedBox(
              height: AppSizes.padding8.h,
            ))
        ),
      ),
    );
  }
}
