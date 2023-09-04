import 'package:rooms/core/index.dart';
import 'package:rooms/features/auth/domain/entities/register_info.dart';
import 'package:rooms/features/auth/presentation/manager/auth_bloc.dart';

class RegisterScreen extends StatelessWidget {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    AuthBloc authBloc = context.read<AuthBloc>();

    return BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
          if(state is AuthRegisterSuccessState){
            Navigator.pushReplacementNamed(context,AppRoutes.home);
          }
  },
  builder: (context, state) {
    bool isPasswordVisible = state is AuthVisiblePasswordState;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.signUp),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.padding20.h.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(AppTexts.createAcc,
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                  ),
                  Text(
                    AppTexts.fullName,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.textPrimaryColor),
                  ),
                  CustomAppTextField(
                    controller: authBloc.firstNameController,
                    isSecure: false,
                    hintText: AppTexts.fullName,
                    textInputType: TextInputType.text,
                  validator: (value){
                      if(value!.isEmpty){
                        return 'This Field is required';
                      }return null;
                  },
                  ),
                  Text(
                    AppTexts.userName,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.textPrimaryColor),
                  ),
                  CustomAppTextField(
                    controller: context.read<AuthBloc>().lastNameController,
                    isSecure: false,
                    hintText: AppTexts.userName,
                    textInputType: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'This Field is required';
                      }return null;
                    },),
                  Text(
                    AppTexts.email,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.textPrimaryColor),
                  ),

                  CustomAppTextField(
                    controller: authBloc.emailController,

                    isSecure: false,
                    prefix:  SvgPicture.asset(
                      AppIcons.email,
                      width: 15.w,
                      height: 15.h,
                    ),
                    suffix: SizedBox(),
                    hintText: 'email@email.com',
                    textInputType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'This Field is required';
                      }return null;
                    },),
                  Text(
                    AppTexts.password,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.textPrimaryColor),
                  ),

                  CustomAppTextField(
                    controller:authBloc. passwordController,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Enter your password';
                      }return null;
                    },

                    isSecure: isPasswordVisible ? false : true,
                    prefix: SvgPicture.asset(
                      AppIcons.lock,
                      width: 15.w,
                      height: 15.h,
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(ToggleVisibilityEvent());

                      },
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off_sharp),
                    ),
                    hasPrefix: true,
                    hintText: '******',
                    textInputType: TextInputType.visiblePassword,
                  ),
                  Text(
                    AppTexts.confirmPassword,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.textPrimaryColor),
                  ),

                  CustomAppTextField(
                    controller: authBloc.confirmPasswordController,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Enter your password';
                      }return null;
                    },

                    isSecure: isPasswordVisible ? false : true,
                    prefix: SvgPicture.asset(
                      AppIcons.lock,
                      width: 15.w,
                      height: 15.h,
                    ),
                    suffix: IconButton(
                      onPressed: () {

                        context.read<AuthBloc>().add(ToggleVisibilityEvent());

                      },
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off_sharp),
                    ),
                    hasPrefix: true,
                    hintText: '******',
                    textInputType: TextInputType.visiblePassword,
                  ),
                  CustomAppButton(
                    onPressed: () {
                     if(_formKey.currentState!.validate()){
                        context.read<AuthBloc>().add(RegisterEvent(registerInfo: RegisterInfo(
                          email: authBloc.emailController.text,
                          password: authBloc.passwordController.text,
                          passwordConfirmation: authBloc.confirmPasswordController.text,
                          firstName: authBloc.firstNameController.text,
                          lastName: authBloc.lastNameController.text,
                        )));
                     }

                    },
                    isText: false,
                    widget:state is AuthLoadingState?Center(child: CircularProgressIndicator()): Text(AppTexts.signUp,style:Theme.of(context).primaryTextTheme.displayMedium),
                  ),
                ].addSeparator(
                    separator: SizedBox(height: AppSizes.padding20.h))

              ),
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
