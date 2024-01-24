import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AlfScreen extends StatelessWidget {
  const AlfScreen({
    required this.alf,
  });
  final String alf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(alf),
          ),
        ),
      ),
    );
  }
}
