import 'package:flutter/material.dart';
import 'package:test_mail_link_auth_3/controllers/auth_controller.dart';
import 'package:test_mail_link_auth_3/views/login_view.dart';

class RegisterView extends StatelessWidget {
  final AuthController _authController = AuthController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: fullNameController, decoration: InputDecoration(labelText: 'Full Name')),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: ageController, decoration: InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: 'Phone')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _authController.register(
                  emailController.text,
                  passwordController.text,
                  fullNameController.text,
                  int.parse(ageController.text),
                  phoneController.text,
                );
                Navigator.pop(context);
              },
              child: Text('Register'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              child: Text('Đã có tài khoản? Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}