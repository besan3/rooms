import 'package:rooms/core/index.dart';
import 'package:rooms/features/auth/presentation/manager/auth_bloc.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {

  },
  builder: (context, state) {
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
                    controller: authBloc.emailController,
                    isSecure: false,
                    hintText: AppTexts.fullName,
                    textInputType: TextInputType.emailAddress,
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
                    controller: context.read<AuthBloc>().emailController,
                    isSecure: false,
                    hintText: AppTexts.userName,
                    textInputType: TextInputType.emailAddress,),
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
                    textInputType: TextInputType.emailAddress,),
                  Text(
                    AppTexts.password,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.textPrimaryColor),
                  ),

                  CustomAppTextField(
                    controller: authBloc.passwordController,
                    isSecure: authBloc.isVisibile ? false : true,
                    prefix: SvgPicture.asset(
                      AppIcons.lock,
                      width: 15.w,
                      height: 15.h,
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        authBloc.add(ToggleVisibilityEvent());
                        print(authBloc.isVisibile);
                      },
                      icon: Icon(authBloc.isVisibile
                          ? Icons.visibility
                          : Icons.visibility_off_sharp),
                    ),
                    hintText: '******',
                    textInputType: TextInputType.visiblePassword,
                  ), Text(
                    AppTexts.confirmPassword,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.textPrimaryColor),
                  ),

                  CustomAppTextField(
                    controller: authBloc.passwordController,
                    isSecure: authBloc.isVisibile ? false : true,
                    prefix: SvgPicture.asset(
                      AppIcons.lock,
                      width: 15.w,
                      height: 15.h,
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(ToggleVisibilityEvent());
                        print(context.read<AuthBloc>().isVisibile);
                      },
                      icon: Icon(context.read<AuthBloc>().isVisibile
                          ? Icons.visibility
                          : Icons.visibility_off_sharp),
                    ),
                    hintText: '******',
                    textInputType: TextInputType.visiblePassword,
                  ),
                  CustomAppButton(
                    onPressed: () {
                      print(super.key);
                     // context.read<AuthBloc>().add(GetProfileEvent());
                    },
                    text: AppTexts.signUp,
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
