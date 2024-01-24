import 'package:flutter/material.dart';
import 'package:gamble/core/app_export.dart';
import 'package:gamble/game_data/player_stats.dart';

import 'reward_item.dart';

List<RewardItem> rewards = [
  RewardItem(
    name: 'Full Energy',
    icon: CustomImageView(
      imagePath: ImageConstant.imgEnergy,
    ),
    effect: () {
      PlayerStats.increaseEnergy(100);
    },
  ),
  RewardItem(
    name: 'Full Heat',
    icon: CustomImageView(
      imagePath: ImageConstant.imgHeart,
    ),
    effect: () {
      PlayerStats.increaseLife(100);
    },
  ),
  RewardItem(
    name: 'Parrot',
    icon: CustomImageView(
      imagePath: ImageConstant.imgFly,
    ),
    effect: () {},
  ),
  RewardItem(
    name: 'Heat incrased',
    icon: CustomImageView(
      imagePath: ImageConstant.imgGroup3,
    ),
    effect: () {
      PlayerStats.increaseLife(100);
    },
  ),
  RewardItem(
    name: 'Oops!',
    icon: Align(
      alignment: Alignment.center,
      child: Text(
        'Nothing...',
        style: CustomTextStyles.titleMediumWhiteA700,
      ),
    ),
    effect: () {},
  ),
];

class SlotMachineRewardsPull {
  static RewardItem getRewardItem(List<int> indexes) {
    int first = indexes[0];
    bool isReward = false;
    for (var index in indexes) {
      if (first == index) {
          isReward = true;
      }
      else
        {
          isReward = false;
          break;
        }
    }
    if (isReward) {
      print('reward');
      return rewards[3];
    } else {
      print('nothing');
      return rewards[4];
    }
  }
}

class RuletteRewardsPull {
  static RewardItem getRewardItem(int indexe) {
    List<RewardItem> returnedItems = [
      rewards[2],
      rewards[0],
      rewards[1],
      rewards[0],
      rewards[1],
      rewards[2],
      rewards[0],
      rewards[2],
      rewards[0],
      rewards[1],
      rewards[2],
      rewards[0],
    ];
    return returnedItems[indexe];
  }
}
