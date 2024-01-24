import 'package:flutter/material.dart';
import 'package:gamble/core/app_export.dart';
import 'package:gamble/game_components/reward_item.dart';
import 'package:gamble/presentation/main_game/additional_widgets/custom_bottom_button.dart';
import 'package:gamble/presentation/main_game/additional_widgets/information_panel.dart';
import 'package:gamble/presentation/main_game/game_bloc/game_bloc.dart';

class RouletteRewardWidget extends StatelessWidget {
  final RewardItem rewardItem;

  const RouletteRewardWidget({Key? key, required this.rewardItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(

        //padding: EdgeInsets.only(top: 100.h),
        height: 150.h,
        width: 150.h,
        child: CustomBottomButton(
          buttonType: ButtonType.ok,
          onTap: () => context.read<GameBloc>().add(
                OpenMainMenu(),
              ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: AppDecoration.fillBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              child: InformationPanel(
                headerText: rewardItem.name,
                insideContent: Container( height: 100.v,child: rewardItem.icon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
