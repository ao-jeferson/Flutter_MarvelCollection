import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void signUp(BuildContext context) async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // Navigate to home screen after successful signup
        Navigator.pushReplacementNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        print(e.message);
      } catch (e) {
        print(e);
      }
    } else {
      print('Senhas Diferentes.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'senha'),
            ),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm senha'),
            ),
            ElevatedButton(
              onPressed: () => signUp(context),
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
