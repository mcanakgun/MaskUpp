import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wear_mask/map_sceen_2.dart';
import 'package:wear_mask/sign_up.dart';
import 'package:wear_mask/themes/app_theme.dart';
import 'package:wear_mask/welcome_screen.dart';
import 'login.dart';
import 'map_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomeScreen(),
        "/Login": (context) => LoginPage(),
        "/SignUp": (context) => SignUpScreen(),
        "/MapHome": (context) => MapHome(),
        "/MapClean": (context) => MapClean(),
      },
    );
  }
}
