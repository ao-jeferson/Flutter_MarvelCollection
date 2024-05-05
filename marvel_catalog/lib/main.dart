import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marvel_catalog/helpers/firebase_options.dart';
import 'package:marvel_catalog/views/pass_reset.dart';
import 'views/login_page.dart';
import 'views/register_page.dart';
import 'views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Heróis',
        theme: kbthem,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => const HomePage(),
          '/passreset': (context) => const PasswordResetPage()
          // '/characterlist' : (context)=> CharacterList(characterStore: ,)
        });
  }
}

// Tema
final ThemeData kbthem = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    hintColor: Colors.blue,
    fontFamily: 'Georgia');
