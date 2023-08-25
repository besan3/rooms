import 'package:rooms/core/index.dart';
import 'package:rooms/features/home/domain/entities/room_details_entity.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';

class RoomDetailsScreen extends StatelessWidget {
  RoomDetailsEntity roomData;

  RoomDetailsScreen({required this.roomData});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(

          body:Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [

                  Stack(
                    children: [

                      SizedBox(
                        height: 290.h,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppSizes.radius26.r)),
                                image: DecorationImage(
                                image: NetworkImage(roomData.data!.image!),fit: BoxFit.fill
                              ),

                            ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:EdgeInsets.symmetric(vertical:AppSizes.padding29.h ),
                                    child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),padding: EdgeInsets.zero),
                                  ),
                                  Padding(
                                    padding:EdgeInsets.symmetric(horizontal:AppSizes.padding20.w,vertical:AppSizes.padding39.h ),
                                    child: Text(roomData.data!.name??'',
                                    style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(fontSize: AppSizes.fontSize20.sp),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(height: 42.h,)
                          ],
                        ),
                      ),


                    ],
                  ),
                  Padding(
                    padding:EdgeInsets.all(AppSizes.padding12.h.w),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 52.r,
                          backgroundColor: Colors.red,
                          child: CircleAvatar(
                            backgroundColor: AppColors.cardColor,
                            radius:50.r,
                            child: Icon(Icons.person,size: 57,color: AppColors.shadeColor,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(roomData.data!.administrator?.name??'',
                                style: Theme.of(context).primaryTextTheme.titleMedium,
                              ),
                              SizedBox(height:5.h,),
                              Text(roomData.data!.posts!.length.toString()+'Posts',
                                style: Theme.of(context).primaryTextTheme.displaySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              roomData.data!.posts!.length==0?Center(child: Text('No Posts yet',  style: Theme.of(context).primaryTextTheme.displaySmall,)):SizedBox()

            ].addSeparator(separator: SizedBox(height: AppSizes.padding20.h,))
          )
        );
      },
    );
  }
}
