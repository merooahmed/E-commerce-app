import 'package:e_commerce_app/feautres/authentication/screens/onboarding/on_boarding.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/navigation_menu.dart';
import 'package:e_commerce_app/utils/routes/app_routes.dart';
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      home: BottomNavigationMenu(),
    );
  }
}
