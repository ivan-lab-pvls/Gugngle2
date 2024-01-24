import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/custom_slot_machine.dart';
import '../additional_widgets/custom_bottom_button.dart';
import '../game_bloc/game_bloc.dart';

class SlotMachineGame extends StatefulWidget {
  final List<RollItem> rollItemsList;

  const SlotMachineGame({Key? key, required this.rollItemsList})
      : super(key: key);

  @override
  State<SlotMachineGame> createState() => _SlotMachineGameState();
}

class _SlotMachineGameState extends State<SlotMachineGame>
    with TickerProviderStateMixin {
  late SlotMachineController _controller;
  late List<RollItem> rollItems;

  @override
  void initState() {
    super.initState();

    setState(() {
      rollItems = [
        RollItem(
          index: 0,
          child: Container(
            padding: EdgeInsets.all(10.h),
            color: Colors.transparent,
            child: CustomImageView(
              imagePath: ImageConstant.imgBanana,
            ),
          ),
        ),
        RollItem(
          index: 1,
          child: Container(
            padding: EdgeInsets.all(10.h),
            color: Colors.transparent,
            child: CustomImageView(
              imagePath: ImageConstant.imgApple,
            ),
          ),
        ),
        RollItem(
          index: 2,
          child: Container(
            padding: EdgeInsets.all(10.h),
            color: Colors.transparent,
            child: CustomImageView(
              imagePath: ImageConstant.imgPeach,
            ),
          ),
        ),
        RollItem(
          index: 3,
          child: Container(
            padding: EdgeInsets.all(10.h),
            color: Colors.transparent,
            child: CustomImageView(
              imagePath: ImageConstant.imgStrawberry,
            ),
          ),
        ),
        RollItem(
          index: 4,
          child: Container(
            padding: EdgeInsets.all(10.h),
            color: Colors.transparent,
            child: CustomImageView(
              imagePath: ImageConstant.imgOrange,
            ),
          ),
        ),
        RollItem(
          index: 5,
          child: Container(
            padding: EdgeInsets.all(10.h),
            color: Colors.transparent,
            child: CustomImageView(
              imagePath: ImageConstant.imgPear,
            ),
          ),
        ),
        RollItem(
          index: 6,
          child: Container(
            padding: EdgeInsets.all(10.h),
            color: Colors.transparent,
            child: CustomImageView(
              imagePath: ImageConstant.imgBlackberry,
            ),
          ),
        ),
        RollItem(
          index: 7,
          child: Container(
            padding: EdgeInsets.all(10.h),
            color: Colors.transparent,
            child: CustomImageView(
              imagePath: ImageConstant.imgMango,
            ),
          ),
        ),
        RollItem(
          index: 8,
          child: Container(
            padding: EdgeInsets.all(10.h),
            color: Colors.transparent,
            child: CustomImageView(
              imagePath: ImageConstant.imgCherry,
            ),
          ),
        ),
      ];
    });
  }

/*  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //precacheImage(Image.asset(ImageConstant.imgApple).image, context);
    //precacheImage(Image.asset(ImageConstant.imgCherry).image, context);
  }

  void onButtonTap() {
    //_controller.stopRandomly();
  }*/

  stopRandomly() async {
    // Инициируем остановку каждого колеса с рандомной задержкой
    final random = Random();

    for (int i = 0; i < 3; i++) {
      // Генерируем рандомную задержку от 500 до 1500 миллисекунд (или другой диапазон по вашему усмотрению)
      final delay = Duration(milliseconds: 500 + random.nextInt(1000));

      // Ожидаем заданную задержку перед остановкой следующего колеса
      await Future.delayed(delay);

      // Запускаем остановку текущего колеса
      _controller.stop(reelIndex: i);
    }
  }

  void onStart() {
    final index = Random().nextInt(20);
    _controller.start(hitRollItemIndex: index < 5 ? index : null);
  }

  bool isClicked = false;

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
          buttonType: ButtonType.spin,
          onTap: () {
            if (!isClicked) {
              isClicked = true;
              onStart();
              stopRandomly();
            }
          },
        ),
      ),
      body: Container(
        decoration: AppDecoration.fillBlack,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 50.h),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgClose,
                      onTap: () {
                        isClicked = false;
//                    _controller..close();
                        context.read<GameBloc>().add(OpenMainMenu());
                        //bloc.add(OpenMainMenu());
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 380.h,
                        height: 400.v,
                        child: SlotMachine(
                          height: 300.v,
                          reelItemExtent: 100.h,
                          width: 400.h,
                          reelHeight: 210.v,
                          reelWidth: 110.h,
                          reelSpacing: 20.h,
                          shuffle: false,
                          rollItems: rollItems,
                          onCreated: (controller) {
                            _controller = controller;

                          },
                          onFinished: (resultIndexes) async {
                            await Future.delayed(Duration(seconds: 1));
                            isClicked = false;
                            context
                                .read<GameBloc>()
                                .add(ClaimSlotMachineReward(resultIndexes));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              transform: Matrix4.translationValues(
                  MediaQuery.of(context).size.width * -.2.h, -10.0.h, 0.0),
              //padding: EdgeInsets.only(right: 100.h, top: 50.h),
              child: CustomImageView(
                fit: BoxFit.scaleDown,
                alignment: Alignment(80.h, 1.25.h),
                imagePath: ImageConstant.imgGurilla,
              ),
            )
          ],
        ),
      ),
    );
  }
}
