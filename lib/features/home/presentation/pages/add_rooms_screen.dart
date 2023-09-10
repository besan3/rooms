import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:rooms/core/index.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/local_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddRoomScreen extends StatefulWidget {
  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
final TextEditingController nameController=TextEditingController();

var formKey=GlobalKey<FormState>();

var image;

  @override
  Widget build(BuildContext context) {
   final HomeBloc homeBloc=context.read<HomeBloc>();
    return BlocConsumer<HomeBloc, HomeState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding20.w),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppTexts.createRoom,
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
                  child:image==null? TextButton.icon(onPressed: ()async{
                    XFile? pickedImage= await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                      maxWidth: 1800,
                      maxHeight: 1800,
                    );
                    if (pickedImage != null) {
                      setState((){
                        image = File(pickedImage.path);
                      }
                      );
                    }},
                      icon: Icon(Icons.photo,
                        color: AppColors.primaryColor,
                      ),
                      label: Text(AppTexts.uploadPhoto,
                          style: Theme.of(context).primaryTextTheme.titleMedium
                      )):Image.file(image)
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
                return null;
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
                          value:homeBloc.isSwitch,
                          inactiveTrackColor: AppColors.cardColor,
                          activeColor: AppColors.primaryColor,
                          onChanged: (value){
                            setState(() {
                              homeBloc.isSwitch=value;
                            });
                          }))
                  // SwitchListTile(value: true, onChanged: (v){},),
                ],
              ),
            ),
            CustomAppButton(
              isText: true,
              text: AppTexts.create,
              onPressed: ()async {

                Dio dio=Dio();
                Response response=await dio.post('https://rooms.doos.info/api/rooms/store',
                    options: Options(
                        headers: {
                          'Authorization': 'Bearer ${SharedPrefs.token}'
                        }),
                    data: {
                      'name': 'name',
                      'is_private': 1,
                      'image':await MultipartFile.fromFile( image.path),
                      // 'image': await  MultipartFile.fromFile(image?.path,
                      //     filename: image.path.split('/').last ?? 'image.jpeg')
                    }

                );
                print(response.statusCode);
                print(image.path);
                print(response);
                if (response.statusCode == 200) {
                  print('Room added successfully!');

                  return response.data;
                } else {
                  print('Failed to add the room. Status code: ${response.statusCode}');
                  throw ServerException();
                }
                // homeBloc.add(AddRoomEvent(name:'room', is_private: 0, image: File('')));
              },
            )
          ].addSeparator(
              separator: SizedBox(
                height: AppSizes.padding20.h,
              ))
      ),
    );
  },
);
  }
}
