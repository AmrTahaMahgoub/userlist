import 'dart:convert';

import 'package:userlist/USERS/models/userdata.dart';
import 'package:userlist/USERS/models/userslist.dart';

import 'package:http/http.dart' as http;
//const url = 'https://gorest.co.in/public/v1/users?page=$page';

class ApiRepository {
  //static const int _perPage = 20;

  Future<List<UserModel>> getUser(int page) async {
    http.Response response = await http.get(Uri.parse('https://gorest.co.in/public/v1/users?page=$page'));
    try {
      if (response.statusCode == 200) {
        String body = response.body;
        var jsonData = jsonDecode(body);
        Users users = Users.fromJson(jsonData);
        List<UserModel> userInfo = users.users.map((e) => UserModel.fromJson(e)).toList();

        return userInfo;
      } else {
        throw Exception('failed to load user data!');
      }
    } catch (e) {
      throw Exception('failed to load user data!');
    }
  }
}
