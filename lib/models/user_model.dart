class UserModel {
  String id = '';
  String name = '';
  String username = '';
  String email = '';

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  static UserModel? fromData(jsonDecode) {
    if (jsonDecode == null) {
      return null;
    }
    return UserModel(
      id: jsonDecode['id'] as String,
      name: jsonDecode['username'] as String,
      username: jsonDecode['username'] as String,
      email: jsonDecode['email'] as String,
    );
  }
  static toJson(UserModel userModel) {
    return {
      'id': userModel.id,
      'name': userModel.name,
      'username': userModel.name,
      'email': userModel.email,

    };
  }
}
