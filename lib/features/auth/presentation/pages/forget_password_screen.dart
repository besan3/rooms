import 'package:rooms/core/index.dart';
import 'package:rooms/features/auth/presentation/manager/auth_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.forgetPassword)
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:EdgeInsets.all(AppSizes.padding20.h.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AppImages.logo)),
                Text(AppTexts.forgetPassword,
                  style: Theme.of(context).primaryTextTheme.titleMedium,
                ),
                 Text(AppTexts.enterEmail,
                  style: Theme.of(context).primaryTextTheme.displaySmall,
                ),
                Text(
                  AppTexts.email,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.textPrimaryColor),
                ),

                CustomAppTextField(
                  controller: context.read<AuthBloc>().emailCodeController,

                  isSecure: false,
                  prefix:  SvgPicture.asset(
                    AppIcons.email,
                    width: 15.w,
                    height: 15.h,
                  ),
                  suffix: SizedBox(),
                  hintText: 'email@email.com',
                  textInputType: TextInputType.emailAddress,),
                CustomAppButton(text: AppTexts.confirmEmail,onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.verification);
                },)
              ].addSeparator(separator: SizedBox(height: AppSizes.padding20.h,))
            ),
          ),
        ),
      );
  },
),
    );
  }
}
