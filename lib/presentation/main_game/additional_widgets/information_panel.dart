import 'package:flutter/cupertino.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:gamble/core/app_export.dart';

class InformationPanel extends StatelessWidget {
  final String headerText;
  final Widget insideContent;

  const InformationPanel(
      {Key? key, required this.headerText, required this.insideContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.v,
      width: 400.h,
      child: Stack(
        children: [
          Container(
           // width: 388.h,
            padding: EdgeInsets.symmetric(
              horizontal: 30. h,
              vertical: 14.v,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: fs.Svg(
                  ImageConstant.imgRewardPanel,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    headerText,
                    style: CustomTextStyles.titleMediumWhiteA700,
                  ),
                ),
                SizedBox(height: 50.v),
                Container(height:160.v, width: 200.h, child: Center(child: insideContent)),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
