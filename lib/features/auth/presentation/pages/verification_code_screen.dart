import 'package:pinput/pinput.dart';
import 'package:rooms/core/index.dart';
import 'package:rooms/features/auth/presentation/manager/auth_bloc.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      Text(AppTexts.enterCode,
                        style: Theme.of(context).primaryTextTheme.titleMedium,
                      ),

                      RichText(text: TextSpan(
                        text: AppTexts.codeSent,
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                        children: [
                          TextSpan(
                            text:  context.read<AuthBloc>().emailCodeController.text,
                            style: Theme.of(context).primaryTextTheme.displaySmall?.copyWith(
                              color: AppColors.primaryColor
                            ),
                          )
                        ]
                      )),
                      Center(
                        child: Pinput(
                          controller:context.read<AuthBloc>().codeController,
                          length: 4,
                        ),
                      ),
                      CustomAppButton(text: AppTexts.continueAdd,onPressed: (){
                        Navigator.pushNamed(context, AppRoutes.newPassword);
                      },),
                      Center(
                        child: GestureDetector(
                          onTap: (){},
                          child: RichText(
                              text: TextSpan(
                                  text: AppTexts.notReceiveCode,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .displaySmall,
                                  children: [
                                    TextSpan(
                                      text: " " + AppTexts.resendCode,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .titleMedium,
                                    )
                                  ])),
                        ),
                      )
                  
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
