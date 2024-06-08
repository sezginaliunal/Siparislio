import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siparislio/controller/webview_controller.dart';
import 'package:siparislio/services/local_notification.dart';
import 'package:siparislio/widgets/main_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends GetView<MyWebViewController> {
  const HomePage({super.key});

  Future<void> _reloadPage() async {
    controller.webViewController.reload();
  }

  @override
  Widget build(BuildContext context) {
    return MainWidget(
      child: SafeArea(
        child: Scaffold(
            body: WebViewWidget(controller: controller.webViewController)),
      ),
    );
  }
}
