import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siparislio/controller/network_controller.dart';
import 'package:siparislio/widgets/no_internet_widget.dart';
import 'package:siparislio/widgets/upgrader.dart';

class MainWidget extends GetView<NetworkController> {
  final Widget child;

  const MainWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final upgrader = MyUpgrader(debugLogging: true);
    return Obx(() => controller.connectionStatus.value != 0
        ? MyUpgradeAlert(
            upgrader: upgrader,
            child: child,
          )
        : const NoInternetWidget());
  }
}
