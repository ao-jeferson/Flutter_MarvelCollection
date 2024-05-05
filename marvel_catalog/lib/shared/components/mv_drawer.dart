import 'package:flutter/material.dart';
import 'package:marvel_catalog/Controllers/Auth_controller.dart';

AuthController _authController = AuthController();

class MvDrawer extends StatelessWidget {
  const MvDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Marvel'),
          ),
          ListTile(
            title: const Text('Personagens'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/characterlist');
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: const Text('Sair'),
                onTap: () {
                  _authController.signOut(context);
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
