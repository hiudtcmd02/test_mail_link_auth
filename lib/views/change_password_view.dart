import 'package:flutter/material.dart';
import 'package:test_mail_link_auth_3/controllers/auth_controller.dart';

class ChangePasswordView extends StatelessWidget {
  final AuthController _authController = AuthController();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đổi Mật Khẩu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: currentPasswordController,
              decoration: InputDecoration(labelText: 'Mật khẩu hiện tại'),
              obscureText: true,
            ),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(labelText: 'Mật khẩu mới'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final success = await _authController.changePassword(
                  currentPasswordController.text,
                  newPasswordController.text,
                );
                if (success) {
                  // Thông báo thành công
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đổi mật khẩu thành công')),
                  );
                  Navigator.pop(context);
                } else {
                  // Thông báo lỗi
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đổi mật khẩu thất bại')),
                  );
                }
              },
              child: Text('Đổi Mật Khẩu'),
            ),
          ],
        ),
      ),
    );
  }
}