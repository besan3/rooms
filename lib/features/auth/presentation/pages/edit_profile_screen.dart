import 'package:rooms/core/index.dart';
import 'package:rooms/core/network/local_storage.dart';

class EditProfileScreen extends StatelessWidget {
 final  profileEntity;
String name=SharedPrefs.getDta(key: 'name');

  @override
  Widget build(BuildContext context) {
    print(name);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(AppSizes.padding20.h.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(profileEntity),
                    backgroundColor: AppColors.cardColor,
                    radius: AppSizes.radius64.r,
                  ),
                  SizedBox(
                    height: 35.h,
                    width: 35.h,
                    child: FloatingActionButton(
                        backgroundColor: AppColors.primaryColor,
                        elevation: 0,mini: true,
                        onPressed:(){}, child:Icon(Icons.edit,color: AppColors.backgroundColor,)),
                  )

                ],
              ),
                Text(name,
                  style: Theme.of(context).primaryTextTheme.titleMedium,
                ),
                ListView.separated(
                  shrinkWrap: true,
                    itemBuilder: (context,index)=>Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:()async{
                            if(index==7||index==8){
                           showAdaptiveDialog(context: context, builder: (context)=>AlertDialog.adaptive(
                             title: Text(index == 7 ?'Are you sure you want to log out':
                                'Are you sure you want to Delete your account',
                             style: Theme.of(context).primaryTextTheme.titleMedium,
                             ),
                             actions: [
                               TextButton(onPressed: (){
                                 Navigator.of(context).pop();
                               }, child: Text('Cancel',style: Theme.of(context).primaryTextTheme.titleMedium,)),
                               TextButton(onPressed: ()async{
                                 if(index==7) {
                                                        await SharedPrefs()
                                                            .removeToken()
                                                            .then((value) => Navigator
                                                                .pushReplacementNamed(
                                                                    context,
                                                                    AppRoutes
                                                                        .login));
                                                      }
                                                    }, child: Text(index==7?'Log out':'Delete Account',style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                                 color: Colors.red
                               ))),
                             ],
                           ));
                            }

                          },
                          child: Text(AppTexts.settings[index],
                            style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                              color: index==7||index==8?Colors.red:AppColors.textPrimaryColor
                            ),
                          ),
                        ),
                     Spacer(),
                     index==2?Text('(English)',
                     style: Theme.of(context).primaryTextTheme.displaySmall,
                     ):SizedBox(),
                     index==4?Switch(value: true, onChanged: (v){}):index==7||index==8?SizedBox(): IconButton(
                         padding: EdgeInsets.zero,
                         onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
                      ],
                    ), separatorBuilder: (context,index)=>SizedBox(
                  height: AppSizes.padding12.h,
                ), itemCount: AppTexts.settings.length)
              ].addSeparator(separator: SizedBox(
                height: AppSizes.padding12.h,
              ),)
            ),
          ),
        ),
      ),
    );
  }

  EditProfileScreen({
    required this.profileEntity,
  });
}