import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionHandler {
  Future<void> requestNotificationPermission();
}

class PermissionHandler extends IPermissionHandler {
  @override
  Future<void> requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      if (status.isDenied || status.isPermanentlyDenied) {
        await Permission.notification.request();
      }
    }
  }
}
