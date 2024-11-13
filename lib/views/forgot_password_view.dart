import 'package:flutter/material.dart';
import 'package:test_mail_link_auth_3/controllers/auth_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  final AuthController _authController = AuthController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _authController.resetPassword(emailController.text);
                Navigator.pop(context);
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}