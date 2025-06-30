class UserModel {
  final String userId;
  final String username;
  final String email;
  final String phoneNo;
  final String password;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.phoneNo,
    required this.password,
  });

  //uuid usecase
  // final String id =  Uuid().v1();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      phoneNo: json['phoneNo'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson(UserModel model) {
    return {
      'userId': model.userId,
      'username': model.username,
      'email': model.email,
      'phoneNo': model.phoneNo,
      'password': model.password,
    };
  }
}
