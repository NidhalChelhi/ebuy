class UserModel {
  String userId, email, name, avatar;

  UserModel({this.userId, this.name, this.email, this.avatar});

  UserModel.fromJSON(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    avatar = map['avatar'];
  }

  toJSON() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'avatar': avatar,
    };
  }
}
