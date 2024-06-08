import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:siparislio/controller/network_controller.dart';
import 'package:siparislio/controller/webview_controller.dart';
import 'package:siparislio/firebase_options.dart';
import 'package:siparislio/services/fcm_services.dart';
import 'package:siparislio/services/local_notification.dart';
import 'package:siparislio/services/permission_handler.dart';

class DependecyInit {
  final FCMServices _fcmServices = FCMServices();

  Future<void> init() async {
    Get.put(NetworkController());

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseMessaging.instance.requestPermission(provisional: true);
    await FirebaseMessaging.instance.getToken();
    Get.put(MyWebViewController());
    await NotificationService().initNotification();
    await _fcmServices.initNotification();
    await PermissionHandler().requestNotificationPermission();
  }
}
