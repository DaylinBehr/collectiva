class UserModel {
  String id = '';
  String name = '';
  String username = '';
  String email = '';

  /// Non-Default Constructor .
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  /// Static method to convert a firestore data object to a UserModel object .
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

  /// Static method to convert a UserModel to a json object fro Firebase.
  static toJson(UserModel userModel) {
    return {
      'id': userModel.id,
      'name': userModel.name,
      'username': userModel.name,
      'email': userModel.email,

    };
  }
}
