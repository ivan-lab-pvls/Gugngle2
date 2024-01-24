import 'package:flutter/material.dart';
import 'package:gamble/core/app_export.dart';

import '../../../core/custom_slot_machine.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(InitGameState()) {
    _setupEventHandlers();
  }

  void _setupEventHandlers() {
    on<StartRouletteGame>(_handleStartRouletteGame);
    on<StartSlotMachineGame>(_handleStartSlotMachineGame);
    on<ClaimSlotMachineReward>(_handleClaimSlotMachineReward);
    on<ClaimRouletteReward>(_handleClaimRouletteReward);
    on<OpenSettingsMenu>(_handleOpenSettingsMenu);
    on<OpenMainMenu>(_handleOpenMainMenu);
  }

  void _handleOpenMainMenu(OpenMainMenu event, Emitter<GameState> emit) {
    emit(InitGameState());
  }

  void _handleStartRouletteGame(
      StartRouletteGame event, Emitter<GameState> emit) {
    bool _clockwise = true;

    final colors = <Color>[
      Colors.red.withAlpha(50),
      Colors.green.withAlpha(30),
      Colors.blue.withAlpha(70),
      Colors.yellow.withAlpha(90),
      Colors.amber.withAlpha(50),
      Colors.indigo.withAlpha(70),
    ];

    final icons = <Widget>[
      Icon(Icons.ac_unit),
      Icon(Icons.access_alarm),
      Icon(Icons.access_alarm),
      Icon(Icons.access_alarm),
      Icon(Icons.access_alarm),
      Icon(Icons.access_alarm),
      Icon(Icons.access_alarm),
      Icon(Icons.access_alarm),
      Icon(Icons.access_alarm),
      Icon(Icons.access_alarm),
      Icon(Icons.access_alarm),
    ];

    final images = <String>[
      // Use [AssetImage] if you have 2.0x, 3.0x images,
      // We only have 1 exact image here

      (ImageConstant.imgFly),
      (ImageConstant.imgEnergy),
      (ImageConstant.imgHeart),
      (ImageConstant.imgEnergy),
      (ImageConstant.imgHeart),
      (ImageConstant.imgFly),
      (ImageConstant.imgEnergy),
      (ImageConstant.imgFly),
      (ImageConstant.imgEnergy),
      (ImageConstant.imgHeart),
      (ImageConstant.imgFly),
      (ImageConstant.imgEnergy),

      // MemoryImage(...)
      // FileImage(...)
      // ResizeImage(...)
    ];

    emit(RouletteGameState(images));
  }

  void _handleStartSlotMachineGame(
      StartSlotMachineGame event, Emitter<GameState> emit) {
    List<RollItem> _rollItemList = [
      RollItem(
        index: 0,
        child: CustomImageView(
          imagePath: ImageConstant.imgBanana,
        ),
      ),
      RollItem(
        index: 1,
        child: CustomImageView(
          imagePath: ImageConstant.imgApple,
        ),
      ),
      RollItem(
        index: 2,
        child: CustomImageView(
          imagePath: ImageConstant.imgPeach,
        ),
      ),
      RollItem(
        index: 3,
        child: CustomImageView(
          imagePath: ImageConstant.imgStrawberry,
        ),
      ),
      RollItem(
        index: 4,
        child: CustomImageView(
          imagePath: ImageConstant.imgOrange,
        ),
      ),
      RollItem(
        index: 5,
        child: CustomImageView(
          imagePath: ImageConstant.imgPear,
        ),
      ),
      RollItem(
        index: 6,
        child: CustomImageView(
          imagePath: ImageConstant.imgBlackberry,
        ),
      ),
      RollItem(
        index: 7,
        child: CustomImageView(
          imagePath: ImageConstant.imgMango,
        ),
      ),
      RollItem(
        index: 8,
        child: CustomImageView(
          imagePath: ImageConstant.imgCherry,
        ),
      ),
    ];

    emit(SlotMachineGameState(rollItemsList: _rollItemList));
  }

  void _handleClaimSlotMachineReward(
      ClaimSlotMachineReward event, Emitter<GameState> emit) {
    emit(SlotMachineRewardState(event.rewardInts)); // Пример выигрыша
  }

  void _handleClaimRouletteReward(
      ClaimRouletteReward event, Emitter<GameState> emit) {
    emit(RouletteRewardState(event.rewardInt)); // Пример выигрыша
  }

  void _handleOpenSettingsMenu(
      OpenSettingsMenu event, Emitter<GameState> emit) {
    emit(SettingsMenuState());
  }
}
