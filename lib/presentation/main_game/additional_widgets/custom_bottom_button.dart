import 'package:flutter/cupertino.dart';
import 'package:gamble/core/app_export.dart';

enum ButtonType { ok, spin, close }

class CustomBottomButton extends StatelessWidget {
  final ButtonType buttonType;
  final Function()? onTap;

  CustomBottomButton({Key? key, required this.buttonType, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomImageView(
        imagePath: getImage(buttonType),
        onTap: onTap,
      ),
    );
  }

  String getImage(ButtonType type) {
    switch (type) {
      case ButtonType.ok:
        return ImageConstant.imgOkButton;
      case ButtonType.close:
        return ImageConstant.imgCloseButton;
      case ButtonType.spin:
        return ImageConstant.imgSpinButton;
    }
  }
}
