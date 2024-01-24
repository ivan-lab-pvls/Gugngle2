import 'package:flutter/material.dart';
import 'package:gamble/widgets/app_bar/custom_app_bar.dart';

class OnboardingPage {
  final String description;
  final String backgroundImage;
  final String imagePath;
  Widget? bottomWidget = Container();
  Widget? centerWidget = Container();
  Widget? floatingBottomWidget = Container();
  PreferredSizeWidget? appBar = CustomAppBar();

  OnboardingPage({
    this.bottomWidget,
    this.centerWidget,
    this.appBar,
    this.floatingBottomWidget,
    required this.backgroundImage,
    required this.description,
    required this.imagePath,
  });
}
