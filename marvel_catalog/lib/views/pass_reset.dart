import 'package:flutter/material.dart';
import 'package:marvel_catalog/Controllers/Auth_controller.dart';

class PasswordResetPage extends StatelessWidget {
  PasswordResetPage({super.key});

  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperação de Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () =>
                  _authController.resetPassword(context, _emailController.text),
              child: const Text('Enviar E-mail de Redefinição'),
            ),
          ],
        ),
      ),
    );
  }
}
