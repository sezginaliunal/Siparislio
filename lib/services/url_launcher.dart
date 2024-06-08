import 'package:url_launcher/url_launcher.dart';

class UrlLauncherManager {
  static Future<void> goToUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {}
  }
}

class UrlLauncherException implements Exception {
  final String msg;
  UrlLauncherException({this.msg = "Could not launch"});
}
