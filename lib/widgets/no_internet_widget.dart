import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siparislio/constants/app_strings.dart';
import 'package:siparislio/constants/assets.dart';
import 'package:siparislio/services/lottie_manager.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieAssetManager(
              lottiePath: LottieItems.no_internet.imagePath,
              width: Get.width / 2,
            ),
            Text(AppStrings.noInternet, style: Get.textTheme.titleMedium),
            Text(AppStrings.noInternetDesc, style: Get.textTheme.titleSmall)
          ],
        ),
      ),
    );
  }
}
