import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:siparislio/config/dependecy_init.dart';
import 'package:siparislio/constants/app_infos.dart';
import 'package:siparislio/view/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependecyInit().init();
  runApp(const Siparislio());
}

class Siparislio extends StatelessWidget {
  const Siparislio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppInfo.appName,
        home: const HomePage());
  }
}
