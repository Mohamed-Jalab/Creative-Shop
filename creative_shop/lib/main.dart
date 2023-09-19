import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'screens/splash_screen.dart';
import 'shared/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  login = sharedPreferences?.getBool('login') ?? false;
  if (login) {
    List<String> list = sharedPreferences?.getStringList('usermodel') ??
        ['NULL', 'NULL', "NULL"];
    publicModel.email = list[0];
    publicModel.password = list[1];
    publicModel.username = list[2];
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff1d2734),
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Color(0xff1d2734),
            systemNavigationBarDividerColor: Color(0xff1d2734),
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark
          )
        )
      ),
      home: const SpalshScreen(),
    );
  }
}
