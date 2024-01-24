import 'package:flutter/material.dart';
import 'package:gamble/core/app_export.dart';
import 'package:gamble/presentation/main_game/game_bloc/game_bloc.dart';
import 'package:gamble/widgets/app_bar/app_bar_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      // title: Text('My Game'),

      actions: [
        Container(
          padding: EdgeInsets.all(4.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgSettings,
            onTap: (){
              context.read<GameBloc>().add(OpenSettingsMenu());
            },
            // color: Colors.black,
          ),
        ),
        BlocBuilder<AppBarBloc, AppBarState>(
          bloc: AppBarBloc(),
          builder: (context, state) {
            return Container(
              height: 100.h,
              width: 350.h,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        //padding: EdgeInsets.only(right 5.h),
                        child: CustomImageView(
                          height: 50.h,
                          width: 50.h,
                          imagePath: ImageConstant.imgEnergy,

                          // color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 100.h,
                        child: Container(
                          padding: EdgeInsets.only(
                            right: 2.h,
                            top: 2.h,
                            bottom: 2.h,
                          ),
                          child: LinearProgressIndicator(
                            backgroundColor: Color.fromRGBO(104, 7, 14, 1),
                            color: Color.fromRGBO(124, 44, 238, 1),
                            value: state.energy / 100,
                            minHeight: 20,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        //padding: EdgeInsets.only(right 5.h),
                        child: CustomImageView(
                          height: 50.h,
                          width: 50.h,
                          imagePath: ImageConstant.imgHeart,

                          // color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 100.h,
                        child: Container(
                          padding: EdgeInsets.only(
                            right: 2.h,
                            top: 2.h,
                            bottom: 2.h,
                          ),
                          child: LinearProgressIndicator(
                            backgroundColor: Color.fromRGBO(104, 7, 14, 1),
                            color: Color.fromRGBO(235, 18, 136, 1),
                            value: state.life / 100,
                            minHeight: 20,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
