import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamble/core/app_export.dart';
import 'package:gamble/game_components/reward_item.dart';
import 'package:gamble/game_components/reward_pull.dart';
import 'package:gamble/game_data/player_stats.dart';
import 'package:gamble/presentation/alf/alf_sceen.dart';
import 'package:gamble/presentation/main_game/additional_widgets/roulette_reward_widget.dart';
import 'package:gamble/presentation/main_game/additional_widgets/settings_menu.dart';
import 'package:gamble/presentation/main_game/additional_widgets/slot_machine_reward_widget.dart';
import 'package:gamble/presentation/main_game/game_bloc/game_bloc.dart';
import 'package:gamble/presentation/main_game/roulette_game/roulette_game.dart';
import 'package:gamble/presentation/main_game/slot_machine_game/slot_machine_game.dart';
import 'package:gamble/widgets/app_bar/custom_app_bar.dart';

import '../../widgets/custom_elevated_button.dart';

class MainGame extends StatefulWidget {
  @override
  State<MainGame> createState() => _MainGameState();

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(),
      child: MainGame(),
    );
  }
}

class _MainGameState extends State<MainGame> {
  String? _alf;
  @override
  void initState() {
    super.initState();
    _alfStart();
  }

  void _alfStart() {
    final a = FirebaseRemoteConfig.instance.getString('alf');

    if (!a.contains('isAlf')) {
      setState(() {
        _alf = a;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    if (_alf != null) {
      return AlfScreen(alf: _alf!);
    }
    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomImageView(
              fit: BoxFit.fitHeight,
              height: 1000.h,
              imagePath: ImageConstant.imgBackgroundOnBoard,
              // margin: EdgeInsets.only(top: 10.h),
              alignment: Alignment.topCenter,
              //color: Colors.,
            ),
            Center(
              child: BlocBuilder<GameBloc, GameState>(
                builder: (context, state) {
                  if (state is InitGameState) {
                    return _mainScreenButtonsWidget(context);
                  } else if (state is RouletteGameState) {
                    return RouletteGame(
                      images: state.images,
                    );
                  } else if (state is SlotMachineGameState) {
                    return SlotMachineGame(
                      rollItemsList: state.rollItemsList,
                    );
                  } else if (state is SlotMachineRewardState) {
                    RewardItem r =
                        SlotMachineRewardsPull.getRewardItem(state.reward);
                    r.effect?.call();
                    return SlotMachineRewardWidget(rewardItem: r);
                  } else if (state is RouletteRewardState) {
                    RewardItem r =
                        RuletteRewardsPull.getRewardItem(state.reward);
                    r.effect?.call();
                    return RouletteRewardWidget(rewardItem: r);
                  } else if (state is SettingsMenuState) {
                    return SettingsMenu();
                  } else {
                    return Center(child: Text('Unknown State'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainScreenButtonsWidget(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 160.v,
                  width: 164.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 33.h,
                    vertical: 21.v,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImageConstant.imgButtonBackground,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: CustomImageView(
                    height: 80.h,
                    width: 80.h,
                    imagePath: ImageConstant.imgBanana,
                    alignment: Alignment.topCenter,
                  ),
                ),
                SizedBox(height: 16.v),
                CustomElevatedButton(
                  width: 138.h,
                  text: "lbl_energy".tr,
                  onPressed: () {
                    PlayerStats.decreaseEnergy(10);
                    context.read<GameBloc>().add(StartSlotMachineGame());
                  },
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 160.v,
                  width: 164.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 33.h,
                    vertical: 21.v,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImageConstant.imgButtonBackground,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgChest,
                    margin: EdgeInsets.only(top: 10.h),
                    alignment: Alignment.topCenter,
                    //color: Colors,
                  ),
                ),
                SizedBox(height: 16.v),
                CustomElevatedButton(
                  width: 138.h,
                  text: "lbl_things".tr,
                  onPressed: () {
                    context.read<GameBloc>().add(StartRouletteGame());
                    PlayerStats.decreaseLife(20);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
