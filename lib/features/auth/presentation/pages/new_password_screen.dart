import 'package:rooms/core/index.dart';
import 'package:rooms/features/auth/presentation/manager/auth_bloc.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppTexts.newPassword)
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
                      Text(AppTexts.newPassword,
                        style: Theme.of(context).primaryTextTheme.titleMedium,
                      ),
                      Text(AppTexts.enterNewPassword,
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                      Text(
                        AppTexts.password,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(color: AppColors.textPrimaryColor),
                      ),

                      CustomAppTextField(
                        controller: context.read<AuthBloc>().passwordController,
                        isSecure: true,
                        prefix:  SvgPicture.asset(
                          AppIcons.lock,
                          width: 15.w,
                          height: 15.h,
                        ),
                        suffix: SizedBox(),
                        hintText: '******',
                        textInputType: TextInputType.visiblePassword,),
                      Text(
                        AppTexts.confirmPassword,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(color: AppColors.textPrimaryColor),
                      ),

                      CustomAppTextField(
                        controller: context.read<AuthBloc>().confirmPasswordController,
                        isSecure: true,
                        prefix:  SvgPicture.asset(
                          AppIcons.lock,
                          width: 15.w,
                          height: 15.h,
                        ),
                        suffix: SizedBox(),
                        hintText: '******',
                        textInputType: TextInputType.visiblePassword,),
                      CustomAppButton(text: AppTexts.continueAdd,onPressed: (){
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
