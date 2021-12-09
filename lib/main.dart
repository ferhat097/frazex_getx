import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frazex_getx/Translation/translation.dart';
import 'package:frazex_getx/screens/main_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Translation(),
      locale: Get.deviceLocale,
      supportedLocales: const [
        Locale("tr", "TR"),
        Locale("en", "EN"),
        Locale("az", "AZ")
      ],
      fallbackLocale: const Locale('az', 'AZ'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Frazex',
      theme: ThemeData(),
      home: const MainScreen(),
    );
  }
}
