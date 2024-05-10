import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marvel_catalog/Controllers/character_controller.dart';
import 'package:marvel_catalog/helpers/firebase_options.dart';
import 'package:marvel_catalog/views/character_detail_view.dart';
import 'package:marvel_catalog/views/character_list_view.dart';
import 'package:marvel_catalog/views/pass_reset_view.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final characterStore = CharacterController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Heróis',
        theme: kbthem,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginView(),
          '/register': (context) => RegisterView(),
          '/home': (context) => CharactersListView(),
          '/passreset': (context) => PasswordResetView(),
          // '/characterdetail': (context) =>
          //     CharacterDetailView(), //id padrão do 3d man
          // //{
          // final args = ModalRoute.of(context)?.settings.arguments as Map;
          // return CharacterDetailsBody(characterId: args['characterId']);
          //CharacterDetailsView(characterId: 1011334) //id padrão do 3d man
          //}
        });
  }
}

// Tema
final ThemeData kbthem = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    hintColor: Colors.blue,
    fontFamily: 'Georgia');
