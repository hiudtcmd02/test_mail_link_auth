class UserModel {
  String uid;
  String fullName;
  String email;
  int age;
  String phone;

  UserModel({required this.uid, required this.fullName, required this.email, required this.age, required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'age': age,
      'phone': phone,
    };
  }
}