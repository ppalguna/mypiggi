import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_piggy_app/db/db_helper.dart';
import 'package:my_piggy_app/services/theme_services.dart';
import 'package:my_piggy_app/ui/theme.dart';
import 'package:my_piggy_app/ui/widget/splashscreen.dart';
//import 'package:my_piggy_app/ui/widget/about.dart';
//import 'package:my_piggy_app/ui/widget/splashscreen.dart';
//import 'package:my_piggy_app/ui/widget/splashscreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget  is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ' Demo',
      debugShowCheckedModeBanner: false,
      theme:Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,      
      // ignore: prefer_const_constructors
      home: SplashScreen(),
      // home: NotifiedPage(label: '',),
    
    );
  }
}
 