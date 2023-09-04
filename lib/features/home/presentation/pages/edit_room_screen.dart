import 'package:dotted_border/dotted_border.dart';
import 'package:rooms/core/index.dart';

class EditRoomScreen extends StatelessWidget {
  final nameController=TextEditingController();
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(AppSizes.padding20.w.h),
          child: Form(
           // key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppTexts.editRoom,
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                  fontSize: AppSizes.fontSize20.sp
                ),
                ),
                Text(AppTexts.roomDisc,
                style: Theme.of(context).primaryTextTheme.displaySmall
                ),
                SizedBox(
                  height: AppSizes.padding12.h,
                ),
                DottedBorder(
                   color: AppColors.primaryColor,//color of dotted/dash line
                strokeWidth: 1, //thickness of dash/dots
                dashPattern: [10,6],
                  child: Container(
                   width: double.infinity,
                    height: 100.h,
                    child: TextButton.icon(onPressed: (){},
                        icon: Icon(Icons.photo,
                        color: AppColors.primaryColor,
                        ),
                        label: Text(AppTexts.uploadPhoto,
                        style: Theme.of(context).primaryTextTheme.titleMedium
                        )),
                  ),
                ),

                  Text(AppTexts.roomName,
                style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                  fontSize: AppSizes.fontSize20.sp
                ),
                ),
              CustomAppTextField(
                  controller:nameController ,
                  isSecure: false,
                  hintText: AppTexts.roomName,
                  textInputType: TextInputType.name,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Field is required';
                    }
                  },
              ),

             SizedBox(

               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(AppTexts.privateRoom,
                  style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                    fontSize: AppSizes.fontSize20.sp
                  ),
                  ),
                  SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: Switch(
                          value: true,
                          activeColor: AppColors.primaryColor,
                          onChanged: (v){}))
                  // SwitchListTile(value: true, onChanged: (v){},),
                 ],
               ),
             ),
              CustomAppButton(
                isText: true,
                text: AppTexts.edit,
                onPressed: (){
                  if(formKey.currentState!.validate())
                    print('vj');
                },
              )
              ].addSeparator(
                  separator: SizedBox(
                    height: AppSizes.padding20.h,
                  ))
            ),
          ),
        ),
      ),
    );
 
  }
}