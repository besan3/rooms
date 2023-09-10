import 'package:rooms/core/index.dart';
import 'package:rooms/features/home/domain/entities/comment_entity.dart';
import 'package:rooms/features/home/presentation/manager/home_bloc.dart';

class CommentScreen extends StatelessWidget {
final Comment comment;

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc=context.read<HomeBloc>();
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(comment.data!.data.length.toString()+AppTexts.comments),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                margin:  EdgeInsets.all(AppSizes.padding20.w.h),
               width: double.infinity,
                height: 680.h,
   
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radius8.r),
                  color: AppColors.cardColor,
                ),
                padding: EdgeInsets.all(AppSizes.padding20.w.h),
                child: comment.data!.data.length==0?
                Text('No Comments yet'): Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                        CircleAvatar(
                          backgroundColor: AppColors.shadeColor,
                          child: Icon(Icons.person),
                        ),

                        Text(" "+comment.data!.data[0].post.user.name,
                          style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: AppSizes.fontSize14.sp
                          ),
                        ),

                      ],
                    ),
                    subtitle: Padding(
                      padding:EdgeInsets.only(left: 50.0),
                      child: Text(comment.data!.data[0].body,
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),


                    //Expanded(child: SizedBox(height: 50.h,)),
                    Spacer(),
                    CustomAppTextField(controller: TextEditingController(), isSecure: false, hintText: AppTexts.writeComment, textInputType: TextInputType.text)
                  ].addSeparator(separator: SizedBox(height: AppSizes.padding20.h,))
                ),
              ),
              ),
         
          ),
        );
      },
    );
  }

CommentScreen({
    required this.comment,
  });
}
