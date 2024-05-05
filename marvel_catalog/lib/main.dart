import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marvel_catalog/helpers/firebase_options.dart';
import 'package:marvel_catalog/stores/character_store.dart';
import 'package:marvel_catalog/views/character_detail.dart';
import 'package:marvel_catalog/views/character_list.dart';
import 'package:marvel_catalog/views/pass_reset.dart';
import 'views/login_page.dart';
import 'views/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final characterStore = CharacterStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Heróis',
        theme: kbthem,
        initialRoute: '/home',
        routes: {
          '/': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => CharactersList(),
          '/passreset': (context) => PasswordResetPage(),
          '/characterdetail': (context) =>
              CharacterDetailsPage(characterId: 1011334) //id padrão do 3d man
        });
  }
}

// Tema
final ThemeData kbthem = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    hintColor: Colors.blue,
    fontFamily: 'Georgia');
