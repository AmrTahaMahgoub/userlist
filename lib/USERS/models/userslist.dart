
class Users {
  final List<dynamic> users;

  Users({required this.users});
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(users: json['data']);
  }
}