import 'package:flutter/material.dart';
import 'package:test_mail_link_auth_3/controllers/auth_controller.dart';
import 'package:test_mail_link_auth_3/views/forgot_password_view.dart';
import 'package:test_mail_link_auth_3/views/home_view.dart';
import 'package:test_mail_link_auth_3/views/register_view.dart';

class LoginView extends StatelessWidget {
  final AuthController _authController = AuthController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var user = await _authController.login(emailController.text, passwordController.text);
                if (user != null && user.emailVerified) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                } else {
                  // Xử lý lỗi nếu cần
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordView()),
                );
              },
              child: Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterView()),
                );
              },
              child: Text('Chưa có tài khoản? Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }
}