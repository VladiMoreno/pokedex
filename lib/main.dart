import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/common/widgets/responsive_wrapper.view.dart';
import 'package:pokedex/config/states.config.dart';
import 'package:pokedex/routes/main.route.dart';
import 'package:pokedex/utils/get_storage.util.dart';

void main() async {
  final appStates = AppStates();
  await StorageService.init();
  appStates.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      child: GetMaterialApp(
        title: 'Pokedex - Vladimir Moreno',
        initialRoute: '/home',
        getPages: AppRoutes.routes,
      ),
    );
  }
}
