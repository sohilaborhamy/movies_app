
class UserModel {
  final String email;
  final String password;
  final String? phoneNumber;

  UserModel({
    required this.email,
    required this.password,
    this.phoneNumber,
  });
}