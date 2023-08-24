import 'package:rooms/core/index.dart';

class CustomAppButton extends StatelessWidget {
 final void Function()? onPressed;
 final Widget? widget;
 final String? text;
  bool? isText=true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:onPressed,
        style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(AppColors.primaryColor),
            minimumSize: MaterialStateProperty.all(Size(double.infinity.w,AppSizes.height65.h)),
            shape:MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius15.r)
            ))
        ),
        child:isText==true? Text(text!,style:Theme.of(context).primaryTextTheme.displayMedium ,):widget
    );
  }

  CustomAppButton({
    this.onPressed,
    this.isText=true,
    this.widget,
   this.text,
  });
}
class CustomAppTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isSecure;
   bool? hasPrefix=false;
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;
  final TextInputType textInputType;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText:isSecure,
      validator: validator,
      onChanged: (value){
        value=controller.text;
      },
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).primaryTextTheme.displaySmall,
          suffixIcon: suffix,
          suffixIconColor: AppColors.shadeColor,
          prefixIcon:hasPrefix==true? Padding(
            padding:  EdgeInsets.all(AppSizes.padding12.h.w),
            child: prefix
          ):null,
          enabledBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(AppSizes.radius15.r),
              borderSide: BorderSide(
                  color: AppColors.shadeColor,
                  width: 1.5
              )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(AppSizes.radius15.r),
              borderSide: BorderSide(
                  color: AppColors.shadeColor,
                  width: 1.5
              )
          ),
          border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(AppSizes.radius15.r),
              borderSide: BorderSide(
                  color: AppColors.shadeColor,
                  width: 1.5
              )
          )
      ),

    );
  }

   CustomAppTextField({
    required this.controller,
    required this.isSecure,
     this.prefix,
     this.suffix,
     this.hasPrefix,
     this.validator,
    required this.hintText,
    required this.textInputType,
  });
}
