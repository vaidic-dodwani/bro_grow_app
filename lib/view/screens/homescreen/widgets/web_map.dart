import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebMap extends StatefulWidget {
  const WebMap({super.key});

  @override
  State<WebMap> createState() => _WebMapState();
}

class _WebMapState extends State<WebMap> {
  late WebViewController controller;

  void _hidePanel() async {
    try {
      await controller.runJavaScript(
          "document.getElementsByClassName(\"exploreComponents__container\")[0].style.display='none'");
      await controller.runJavaScript(
          "document.getElementsByClassName(\"exploreComponents__map\")[0].style.height='100vh'");
      await controller.runJavaScript(
          "document.getElementsByClassName(\"right-pane\")[0].style.display='none'");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          _hidePanel();
        },
      ))
      ..loadRequest(Uri.parse(
          'https://www.phonepe.com/pulse/explore/transaction/2024/1/'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
