import 'package:rooms/core/index.dart';
import 'package:rooms/features/auth/presentation/manager/auth_bloc.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          // print(state.message);
          Fluttertoast.showToast(msg: state.message, textColor: Colors.white);
        }
      },
      builder: (context, state) {
        bool isPasswordVisible = state is AuthVisiblePasswordState;

        return Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.padding20.h.w),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(child: Image.asset(AppImages.logo)),
                      Text(
                        AppTexts.email,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(color: AppColors.textPrimaryColor),
                      ),

                      CustomAppTextField(
                          controller:emailController,
                        validator: (value) {
                         if(value!.isEmpty){
                           return 'Enter your email';
                         }return null;
                        },
                        hasPrefix: true,
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
                        controller: passwordController,
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
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: ()=>Navigator.pushNamed(context, AppRoutes.forgetPassword)
                            ,
                            child: Text(
                              AppTexts.forgetPassword,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .displaySmall
                                  ?.copyWith(
                                      color: Colors.red,
                                      fontSize: AppSizes.fontSize12.sp),
                            ),
                          ),
                        ],
                      ),

                      CustomAppButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(LoginEvent(email: emailController.text,password: passwordController.text));
                          }
                        },
                        isText: false,
                        widget:state is AuthLoadingState?Center(child: CircularProgressIndicator()): Text(AppTexts.logIn,style:Theme.of(context).primaryTextTheme.displayMedium),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: ()=>Navigator.pushNamed(context,AppRoutes.signUp),
                          child: RichText(
                              text: TextSpan(
                                  text: AppTexts.dontHaveAcc,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .displaySmall,
                                  children: [
                                TextSpan(
                                  text: " " + AppTexts.signUp,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleMedium,
                                )
                              ])),
                        ),
                      )
                    ].addSeparator(
                        separator: SizedBox(height: AppSizes.padding20.h))
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}
