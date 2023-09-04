import 'package:rooms/core/index.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      length: 2,
      child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.primaryColor,
              labelColor:AppColors.primaryColor,
              labelStyle: Theme.of(context).primaryTextTheme.titleMedium,
              unselectedLabelStyle:Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                  color: AppColors.hintColor,
                  fontWeight: FontWeight.w500
              ) ,
              tabs: [
                Tab(
                  text: AppTexts.rooms,
                ),
                Tab(
                  text: AppTexts.people,
                ),

              ],

            ),
            SizedBox(
              height: 300,
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height:55.h,
                        child: SearchBar(
                        elevation:MaterialStatePropertyAll(
                          0
                        ),hintText: AppTexts.search,hintStyle:MaterialStatePropertyAll(
                            Theme.of(context).primaryTextTheme.displaySmall
                        ),
                leading: Icon(Icons.search,
                          color:AppColors.hintColor
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            AppColors.cardColor
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height:55.h,
                        child: SearchBar(
                          elevation:MaterialStatePropertyAll(
                              0
                          ),
                          leading: Icon(Icons.search,
                              color:AppColors.hintColor
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                              AppColors.cardColor
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ].addSeparator(
              separator: SizedBox(
                height: AppSizes.padding20.h,
              ))


      ),
    );
  }
}
