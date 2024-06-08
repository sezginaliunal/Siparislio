import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:siparislio/constants/app_strings.dart';
import 'package:siparislio/services/api/http_manager.dart';
import 'package:siparislio/utils/trimString.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:siparislio/constants/app_infos.dart';
import 'package:siparislio/services/url_launcher.dart';

class MyWebViewController extends GetxController {
  //Variables
  late final WebViewController _webViewController;
  WebViewController get webViewController => _webViewController;
  late Timer _timer;
  final HttpManager _httpManager = HttpManager();

  @override
  void onClose() {
    startTimer();
    super.onClose();
  }

  @override
  void onInit() {
    init();
    startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  // Inat methodu
  Future<void> init() async {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
          onNavigationRequest: goToNavigate, onProgress: onProgressMethod))
      ..loadRequest(Uri.parse(AppInfo.appUrl));
  }

  Future<NavigationDecision> goToNavigate(NavigationRequest request) async {
    //!! CheckOtherUrls Todo
    if (!request.url.contains(AppInfo.contains)) {
      await UrlLauncherManager.goToUrl(request.url);
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }

  Future<String?> getCookie() async {
    await _webViewController
        .runJavaScriptReturningResult(AppStrings.getCookieStrings);
    final result = await _webViewController
        .runJavaScriptReturningResult(AppStrings.getCookie);
    // ignore: unnecessary_null_comparison

    inspect(result);
    // ignore: unnecessary_null_comparison
    if (result != null) {
      return result.toString();
    }
    return 'null';
  }

  Future<void> onProgressMethod(progress) async {
    if (progress == 100) {
      await getCookie();
    }
  }

  //Timer
  Future<void> startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (val) async {
      getCookie();
      final String? authToken = await getCookie();
      if (authToken != "null") {
        stopTimer();
        final fcmToken = await FirebaseMessaging.instance.getToken();
        await _httpManager.sendPostRequest(
            fcmToken ?? "null", trimFirstAndLastChar(authToken!));
      }
    });
  }

  void stopTimer() async {
    _timer.cancel();
    print("Timer durduruldu");
  }
}
