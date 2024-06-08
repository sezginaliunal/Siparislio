import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siparislio/constants/assets.dart';
import 'package:siparislio/services/lottie_manager.dart';
import 'package:upgrader/upgrader.dart';

class MyUpgrader extends Upgrader {
  MyUpgrader({super.debugLogging});

  @override
  bool isUpdateAvailable() {
    final storeVersion = currentAppStoreVersion;
    final installedVersion = currentInstalledVersion;
    if (kDebugMode) {
      print('storeVersion=$storeVersion');
    }
    if (kDebugMode) {
      print('installedVersion=$installedVersion');
    }
    return super.isUpdateAvailable();
  }
}

class MyUpgradeAlert extends UpgradeAlert {
  MyUpgradeAlert({super.key, super.upgrader, super.child});

  /// Override the [createState] method to provide a custom class
  /// with overridden methods.
  @override
  UpgradeAlertState createState() => MyUpgradeAlertState();
}

class MyUpgradeAlertState extends UpgradeAlertState {
  @override
  void showTheDialog({
    Key? key,
    required BuildContext context,
    required String? title,
    required String message,
    required String? releaseNotes,
    required bool barrierDismissible,
    required UpgraderMessages messages,
  }) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: LottieAssetManager(
                              lottiePath: LottieItems.spaceship.imagePath),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Yeni versiyon şu anda güncel",
                            style: Get.textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                            "Yeni versiyonu hemen güncellemek için alttaki butona tıklayınız"),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {
                              onUserUpdated(
                                  context, !widget.upgrader.blocked());
                            },
                            child: Text('Güncelle',
                                style: Get.textTheme.labelMedium
                                    ?.copyWith(color: Colors.white)))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.width / 1.2,
                  height: 20,
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                ),
              ],
            ),
          );
        });
  }
}
