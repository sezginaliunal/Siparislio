// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:siparislio/constants/app_infos.dart';

class HttpManager {
  Future<void> sendPostRequest(String fcmToken, String bearerToken) async {
    final url = Uri.parse(AppInfo.postFcmTokenUrl); // URL'inizi buraya girin

    await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      },
      body: jsonEncode({'fcm_token': fcmToken}),
    );
  }
}
