import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_mail_link_auth_3/models/user_model.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> register(String email, String password, String fullName, int age, String phone) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    UserModel userModel = UserModel(
      uid: userCredential.user!.uid,
      fullName: fullName,
      email: email,
      age: age,
      phone: phone,
    );

    await _firestore.collection('users').doc(userModel.uid).set(userModel.toMap());
    await userCredential.user!.sendEmailVerification();
    return userModel;
  }

  Future<User?> login(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  // Lấy thông tin người dùng hiện tại
  Future<UserModel?> getCurrentUser() async {
    User? firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      DocumentSnapshot snapshot = await _firestore.collection('users').doc(firebaseUser.uid).get();
      return UserModel(
        uid: snapshot['uid'],
        fullName: snapshot['fullName'],
        email: snapshot['email'],
        age: snapshot['age'],
        phone: snapshot['phone'],
      );
    }
    return null;
  }

  //Đổi mật khẩu
  Future<bool> changePassword(String currentPassword, String newPassword) async {
    User? user = _auth.currentUser;

    if (user != null) {
      try {
        // Đăng nhập tạm thời để xác thực mật khẩu hiện tại
        await _auth.signInWithEmailAndPassword(email: user.email!, password: currentPassword);
        // Đổi mật khẩu
        await user.updatePassword(newPassword);
        return true;
      } catch (e) {
        return false; // Đổi mật khẩu thất bại
      }
    }
    return false; // Người dùng không tồn tại
  }
}