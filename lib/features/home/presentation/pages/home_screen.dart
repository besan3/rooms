import 'package:rooms/features/home/presentation/manager/home_bloc.dart';

import '../../../../core/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc=context.read<HomeBloc>();
    bool isLiked=false;
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if(state is GetHomeDataErrorState){
           Fluttertoast.showToast(msg: state.message, );
        }
        if(state is GetHomeDataSuccessState){
          homeBloc.homeEntity=state.homeEntity;
        }

      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              color: AppColors.cardColor,
              child:Padding(
                padding:  EdgeInsets.symmetric(horizontal:AppSizes.padding12.w,vertical:AppSizes.padding29.h ),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    SizedBox(
                      width:230.w,
                      child: RichText(
                        text: TextSpan(
                            text: AppTexts.joinSome,
                            style: Theme.of(context).primaryTextTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: AppTexts.exploreRooms,
                                style: Theme.of(context).primaryTextTheme.titleMedium,)
                            ]
                        ),
                      ),
                    ),
                    Image.asset(AppImages.house,)
                  ]
                )
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppTexts.recommended,style: Theme.of(context).primaryTextTheme.titleMedium,),
                Text(AppTexts.viewAll,style: Theme.of(context).primaryTextTheme.displaySmall,),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 255.h,
              child: ListView.separated(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=> Container(
        width: 195.w,
        child: Card(
        color:  AppColors.cardColor,
        shadowColor: AppColors.shadeColor,
        elevation: 0.5,surfaceTintColor:AppColors.cardColor,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius26-5.r)
        ),
        child: Column(
        children: [
        Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
        Image.network(homeBloc.homeEntity.data!.rooms[index].image,width:195.w,fit: BoxFit.fill,),
        Padding(
        padding: const EdgeInsets.all(5),
        child: CircleAvatar(
        backgroundColor: AppColors.backgroundColor,
        radius: AppSizes.radius15.r,
        child: Center(
        child: IconButton(onPressed: (){
        homeBloc.add(LikeRoomEvent());
        print(state);
        },
        padding: EdgeInsets.zero,
        icon:state is LikedState? Icon(Icons.favorite_border_outlined,color: Colors.red,):Icon(Icons.favorite_border_outlined,color:AppColors.shadeColor,)))),
        )
        ],
        ),
        SizedBox(height: 5,),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(homeBloc.homeEntity.data!.rooms[index].name,style: Theme.of(context).primaryTextTheme.titleMedium),
        Text(homeBloc.homeEntity.data!.rooms[index].administrator.name,style: Theme.of(context).primaryTextTheme.bodySmall),
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
        children: [
        Icon(Icons.group_outlined,color:AppColors.shadeColor),


        Text(homeBloc.homeEntity.data!.rooms[index].participantsCount.toString(),style: Theme.of(context).primaryTextTheme.bodySmall),
        ],
        ),
        IconButton(onPressed: (){},
        padding: EdgeInsets.zero,
        icon: Icon(Icons.login,size: 20,color:AppColors.shadeColor))
        ],
        ),
        ),

        ].addSeparator(separator: SizedBox(height:3.h,))
        ),
        ),
        ), 
                  separatorBuilder: (context,index)=>SizedBox(width: AppSizes.padding12.w,), itemCount: homeBloc.homeEntity.data!.rooms.length),
            ),Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppTexts.mostPopular,style: Theme.of(context).primaryTextTheme.titleMedium,),
                Text(AppTexts.viewAll,style: Theme.of(context).primaryTextTheme.displaySmall,),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 255.h,
              child: ListView.separated(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=> Container(
        width: 195.w,
        child: Card(
        color:  AppColors.cardColor,
        shadowColor: AppColors.shadeColor,
        elevation: 0.5,surfaceTintColor:AppColors.cardColor,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius26-5.r)
        ),
        child: Column(
        children: [
        Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
        Image.network(homeBloc.homeEntity.data!.rooms[index].image,width:195.w,fit: BoxFit.fill,),
        Padding(
        padding: const EdgeInsets.all(5),
        child: CircleAvatar(
        backgroundColor: AppColors.backgroundColor,
        radius: AppSizes.radius15.r,
        child: Center(
        child: IconButton(onPressed: (){
        homeBloc.add(LikeRoomEvent());
        print(state);
        },
        padding: EdgeInsets.zero,
        icon:state is LikedState? Icon(Icons.favorite_border_outlined,color: Colors.red,):Icon(Icons.favorite_border_outlined,color:AppColors.shadeColor,)))),
        )
        ],
        ),
        SizedBox(height: 5,),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(homeBloc.homeEntity.data!.rooms[index].name,style: Theme.of(context).primaryTextTheme.titleMedium),
        Text(homeBloc.homeEntity.data!.rooms[index].administrator.name,style: Theme.of(context).primaryTextTheme.bodySmall),
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
        children: [
        Icon(Icons.group_outlined,color:AppColors.shadeColor),


        Text(homeBloc.homeEntity.data!.rooms[index].participantsCount.toString(),style: Theme.of(context).primaryTextTheme.bodySmall),
        ],
        ),
        IconButton(onPressed: (){},
        padding: EdgeInsets.zero,
        icon: Icon(Icons.login,size: 20,color:AppColors.shadeColor))
        ],
        ),
        ),

        ].addSeparator(separator: SizedBox(height:3.h,))
        ),
        ),
        ),
                  separatorBuilder: (context,index)=>SizedBox(width: AppSizes.padding12.w,), itemCount: homeBloc.homeEntity.data!.rooms.length),
            ),
           


          ].addSeparator(separator: SizedBox(height: AppSizes.padding20.h,))

        );
      },
    );
  }
}
