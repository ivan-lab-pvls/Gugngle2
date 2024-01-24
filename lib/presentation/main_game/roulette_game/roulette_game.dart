import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:gamble/core/app_export.dart';

import '../additional_widgets/custom_bottom_button.dart';
import '../game_bloc/game_bloc.dart';

class RouletteGame extends StatefulWidget {
  final List<String> images;

  const RouletteGame({Key? key, required this.images}) : super(key: key);

  @override
  State<RouletteGame> createState() => _RouletteGameState();
}

class _RouletteGameState extends State<RouletteGame>
    with TickerProviderStateMixin {
  StreamController<int> selected = StreamController<int>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int rand = 0;

  @override
  Widget build(BuildContext context) {
    final images = <String>[
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
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        //padding: EdgeInsets.only(top: 100.h),
        height: 150.h,
        width: 150.h,
        child: CustomBottomButton(
          buttonType: ButtonType.spin,
          onTap: () {
            rand = Fortune.randomInt(0, images.length);
            print(rand);
            selected.add(rand);
          },
        ),
      ),
      body: Container(
        decoration: AppDecoration.fillBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: 50.h),
              child: Align(
                alignment: Alignment.topRight,
                child: CustomImageView(
                  imagePath: ImageConstant.imgClose,
                  onTap: () {
                    selected.close();
                    context.read<GameBloc>().add(OpenMainMenu());
                    //bloc.add(OpenMainMenu());
                  },
                ),
              ),
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                    width: 400.h,
                    height: 400.v,
                    child: _backgroundGrass(context)),
                SizedBox(
                  width: 400.h,
                  height: 400.v,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: AlignmentDirectional.center,
                      children: [
                        FortuneWheel(
                          onAnimationEnd: () => {
                            context
                                .read<GameBloc>()
                                .add(ClaimRouletteReward(rand))
                          },
                          indicators: [FortuneIndicator(child: Container())],
                          animateFirst: false,
                          selected: selected.stream,
                          items: [
                            for (int i = 0; i < images.length; i++)
                              FortuneItem(
                                child: RotatedBox(
                                  quarterTurns: 5,
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 1),
                                    alignment: Alignment.topCenter,
                                    height: 100.h,
                                    width: 40.h,
                                    child: CustomImageView(
                                      imagePath: images[i],
                                    ),
                                  ),
                                ),
                                style: FortuneItemStyle(
                                  color: i % 2 == 0
                                      ? Color.fromRGBO(254, 213, 137, 1)
                                      : Color.fromRGBO(116, 182, 97, 1),
                                  borderColor: Colors.white,
                                  borderWidth: 2,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CustomImageView(
                    imagePath: ImageConstant.imgRoulettePointer,
                    height: 70.v,
                    width: 100.h,
                    alignment: Alignment.topCenter)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _backgroundGrass(BuildContext context) {
    return Container(
      height: 410.v,
      width: 410.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CustomImageView(
              imagePath: ImageConstant.imgGrassRightTop,
              // margin: EdgeInsets.only(top: 40.h),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomImageView(
              imagePath: ImageConstant.imgGrassRightBottom,

              //margin: EdgeInsets.only(bottom: 279.v),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CustomImageView(
              imagePath: ImageConstant.imgGrassLeftTop,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: CustomImageView(
              imagePath: ImageConstant.imgGrassLeftBottom,
            ),
          ),
        ],
      ),
    );
  }
}
