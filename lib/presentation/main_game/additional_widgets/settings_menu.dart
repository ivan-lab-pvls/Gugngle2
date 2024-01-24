import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gamble/core/app_export.dart';

import '../game_bloc/game_bloc.dart';
import 'custom_bottom_button.dart';
import 'information_panel.dart';

class SettingsMenu extends StatefulWidget {
  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  bool sound = false;

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
          buttonType: ButtonType.close,
          onTap: () => context.read<GameBloc>().add(
                OpenMainMenu(),
              ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: AppDecoration.fillBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: InformationPanel(
                headerText: 'Settings',
                insideContent: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ShowParse(
                                      show:
                                          'https://docs.google.com/document/d/1qQs9brEd0Bq_W6-PP13TpoK-tiTVN3EUexCmYLPUmsc/edit?usp=sharing',
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Privacy Policy',
                                style: CustomTextStyles.titleMediumWhiteA700_1,
                              ),
                            ),
                            height: 40.v,
                          ),
                          Container(
                            height: 40.v,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ShowParse(
                                      show:
                                          'https://docs.google.com/document/d/1QUQdzzjr3tvorZeQ7sfM5qefG2c-i0ODKGfwF7B3-eE/edit?usp=sharing',
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Term of Use',
                                style: CustomTextStyles.titleMediumWhiteA700_1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowParse extends StatelessWidget {
  final String show;

  const ShowParse({required this.show});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(show)),
      ),
    );
  }
}
