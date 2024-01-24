import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:gamble/core/app_export.dart';
import 'package:gamble/presentation/onboarding_screen/onboarding_page.dart';
import 'package:gamble/widgets/app_bar/custom_app_bar.dart';

import '../../widgets/custom_elevated_button.dart';
import '../main_game/additional_widgets/custom_bottom_button.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

  static Widget builder(BuildContext context) {
    return OnboardingScreen();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<OnboardingPage> onboardingPagesList = [
      OnboardingPage(
        description:
            "Welcome to Jungle World. Exciting adventures and challenges await you!",
        imagePath: ImageConstant.imgClose,
        backgroundImage: ImageConstant.imgBackgroundOnBoard,
      ),
      OnboardingPage(
          description:
              "Here you will survive among the jungle, fight for energy and lives",
          imagePath: ImageConstant.imgClose,
          backgroundImage: ImageConstant.imgBackgroundOnGame,
          centerWidget: CustomImageView(
            imagePath: ImageConstant.imgPngwing2,
          )),
      OnboardingPage(
        description:
            "You can also receive bonuses that will help you progress through the game!",
        imagePath: ImageConstant.imgClose,
        backgroundImage: ImageConstant.imgBackgroundOnGame,
        bottomWidget: CustomImageView(
          imagePath: ImageConstant.imgGurilla,
        ),
      ),
      OnboardingPage(
        appBar: CustomAppBar(),
        description:
            "You have two bars on the top. One for energy and one for heat.",
        imagePath: ImageConstant.imgClose,
        backgroundImage: ImageConstant.imgBackgroundOnBoard,
        centerWidget: mainButtons(),
      ),
      OnboardingPage(
        appBar: CustomAppBar(),
        description: "Energy recovers on its own when you do nothing.",
        imagePath: ImageConstant.imgClose,
        backgroundImage: ImageConstant.imgBackgroundOnBoard,
        centerWidget: mainButtons(),
      ),
      OnboardingPage(
        appBar: CustomAppBar(),
        description: 'Heat is restored after eating.',
        imagePath: ImageConstant.imgClose,
        backgroundImage: ImageConstant.imgBackgroundOnBoard,
        centerWidget: mainButtons(),
      ),
      OnboardingPage(
        appBar: CustomAppBar(),
        description:
            'Now you have full energy! Let’s do fishing for useful things. You can catch something that can help you.',
        imagePath: ImageConstant.imgClose,
        backgroundImage: ImageConstant.imgBackgroundOnBoard,
        centerWidget: mainButtonsWithBlur(),
      ),
      OnboardingPage(
        appBar: CustomAppBar(),
        description:
            "Here you can catch Full energy, Full heat or summon the Ice Queen. Let’s try.",
        imagePath: ImageConstant.imgClose,
        backgroundImage: ImageConstant.imgBackgroundOnBoard,
        centerWidget: rouletteWidget(),
        bottomWidget: Container(
          //padding: EdgeInsets.only(top: 100.h),
          height: 150.h,
          width: 150.h,
          child: CustomBottomButton(
            buttonType: ButtonType.spin,
            onTap: () {},
          ),
        ),
      ),
      // Добавьте больше экранов по мере необходимости
    ];
    return PageView.builder(
      controller: pageController,
      itemCount: onboardingPagesList.length,
      onPageChanged: (index) {
        setState(() {
          currentPage = index;
        });
      },
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          if (currentPage == onboardingPagesList.length - 1) {
            Navigator.pushReplacementNamed(context, AppRoutes.initialRoute);
          } else {
            // Переход на следующую стадию
            pageController.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
        },
        child: Scaffold(
          floatingActionButton: onboardingPagesList[index].floatingBottomWidget,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: onboardingPagesList[index].appBar,
          body: Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  fit: BoxFit.fitHeight,
                  height: 1000.h,
                  imagePath: onboardingPagesList[index].backgroundImage,
                  // margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.bottomLeft,
                  //color: Colors.,
                ),
                Align(
                  //xCenter Widget
                  alignment: Alignment.center,
                  child: Container(
                    //width: 600.h,
                    child: onboardingPagesList[index].centerWidget,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50.h),
                    child: Container(
                      //width: 600.h,
                      child: onboardingPagesList[index].bottomWidget,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 150.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 20.v),
                      width: 400.h,
                      decoration: AppDecoration.fillWhiteOnBoard,
                      child: Text(
                        onboardingPagesList[index].description,
                        style: CustomTextStyles.titleMediumWhiteA700Black,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 150.h, bottom: 50.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 20.v),
                      width: 400.h,
                      //decoration: AppDecoration.fillWhiteOnBoard,
                      child: Text(
                        'Tap anywhere to continue',
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.titleMediumWhiteA700_1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mainButtons() {
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
                  width: 160.h,
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
                  onPressed: () {},
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
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget mainButtonsWithBlur() {
    return Container(
      decoration: AppDecoration.fillBlack,
      height: 1000,
      width: 1000,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 160.v,
                        width: 160.h,
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                /*Container(
                  height: 250.v,
                  width: 150.h,
                  color: appTheme.black90075.withOpacity(0.5),
                )*/
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
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget rouletteWidget() {
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
    return Container(
      decoration: AppDecoration.fillBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0.h),
                child: _backgroundGrass(context),
              ),
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
                        // onAnimationEnd: () => {context.read<GameBloc>().add(ClaimRouletteReward(rand))},
                        indicators: [FortuneIndicator(child: Container())],
                        animateFirst: false,
                        //selected: selected.stream,
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
                  alignment: Alignment.topCenter),
            ],
          ),
        ],
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
