import 'dart:convert';

import 'package:userlist/USERS/models/userslist.dart';

import 'package:http/http.dart' as http;

class ApiRepository {


  Future<UsersListModel> getUserList() async {
    http.Response userdata = await http.get(Uri.parse('https://gorest.co.in/public/v1/users?page=1'));
    return UsersListModel.fromJson(jsonDecode(userdata.body));



  }
}
