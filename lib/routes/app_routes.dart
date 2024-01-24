import 'package:flutter/material.dart';
import 'package:gamble/presentation/main_game/main_game.dart';
import 'package:gamble/presentation/onboarding_screen/onboarding_screen.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String onBoardingRoute = '/onboardingRoute';

  static Map<String, WidgetBuilder> get routes => {
        initialRoute: MainGame.builder,
        onBoardingRoute: OnboardingScreen.builder,
      };
}
