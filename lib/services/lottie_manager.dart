import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAssetManager extends StatelessWidget {
  const LottieAssetManager(
      {super.key,
      required this.lottiePath,
      this.animationController,
      this.animate,
      this.width,
      this.repeat});
  final String lottiePath;
  final AnimationController? animationController;
  final bool? animate;
  final bool? repeat;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(lottiePath,
        repeat: repeat,
        controller: animationController,
        animate: animate,
        width: width);
  }
}
