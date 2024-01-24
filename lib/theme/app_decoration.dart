import 'package:flutter/material.dart';
import 'package:gamble/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black90075.withOpacity(0.5),
      );

  static BoxDecoration get white => BoxDecoration(
        color: appTheme.black90075.withOpacity(0.5),
      );

  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700.withOpacity(0.7),
      );
  static BoxDecoration get fillWhiteOnBoard => BoxDecoration(
    color: appTheme.whiteA700.withOpacity(0.7),

    borderRadius: BorderRadius.circular(10)
  );

  // Gradient decorations
  static BoxDecoration get gradientBlackToBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black90075,
            appTheme.whiteA700.withOpacity(0),
            appTheme.black90075,
          ],
        ),
      );

  static BoxDecoration get gradientVinetka => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, -1.8),
          end: Alignment(0.5, 1.8),
          //stops: [0, 0.8, 1], // Добавляем стопы
          colors: [
            Colors.black.withOpacity(1), // Черный в начале
            Colors.white, // Прозрачный в середине
            Colors.black.withOpacity(1), // Черный в конце
          ],
        ),
      );

  static BoxDecoration get gradientTealToGreen => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.teal300,
            appTheme.green300,
          ],
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
