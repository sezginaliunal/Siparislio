import 'package:flutter/material.dart';
import 'package:siparislio/constants/app_strings.dart';
import 'package:siparislio/constants/assets.dart';
import 'package:siparislio/services/lottie_manager.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieAssetManager(
              lottiePath: LottieItems.error.imagePath,
              repeat: false,
            ),
            Text(AppStrings.errorTitle,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(AppStrings.errorDescription,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
          ],
        ),
      )),
    );
  }
}
