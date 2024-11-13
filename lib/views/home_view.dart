import 'package:flutter/material.dart';
import 'package:test_mail_link_auth_3/controllers/auth_controller.dart';
import 'package:test_mail_link_auth_3/models/user_model.dart';
import 'package:test_mail_link_auth_3/views/change_password_view.dart';
import 'package:test_mail_link_auth_3/views/login_view.dart';

class HomeView extends StatelessWidget {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: _authController.getCurrentUser(), // Gọi phương thức để lấy thông tin người dùng
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Hiển thị vòng xoay khi đang tải
        } else if (snapshot.hasError) {
          return Center(child: Text('Đã có lỗi xảy ra!')); // Hiển thị lỗi
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('Không tìm thấy thông tin người dùng.')); // Không có thông tin người dùng
        }

        final user = snapshot.data!; // Lấy thông tin người dùng

        return Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Chào mừng bạn đến với trang chủ!'),
                SizedBox(height: 20),
                Text('Xin chào, ${user.fullName}!', style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await _authController.logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  child: Text('Đăng xuất'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePasswordView()),
                    );
                  },
                  child: Text('Đổi mật khẩu'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}