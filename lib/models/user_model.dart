class UserModel {
  String id = '';
  String name = '';
  String email = '';
  String photoUrl = '';

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  static UserModel? fromData(jsonDecode) {
    if (jsonDecode == null) {
      return null;
    }
    return UserModel(
      id: jsonDecode['id'] as String,
      name: jsonDecode['name'] as String,
      email: jsonDecode['email'] as String,
      photoUrl: jsonDecode['photoUrl'] as String,
    );
  }
  static toJson(UserModel userModel) {
    return {
      'id': userModel.id,
      'name': userModel.name,
      'email': userModel.email,
      'photoUrl': userModel.photoUrl,
    };
  }
}
