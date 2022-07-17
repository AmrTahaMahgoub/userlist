import 'dart:convert';

import 'package:userlist/USERS/models/userslist.dart';

import 'package:http/http.dart' as http;

class ApiRepository {


  Future<UsersListModel> GetUserList() async {
    http.Response userdatatypedata = await http.get(Uri.parse('https://gorest.co.in/public/v1/users?page=1'));
    return UsersListModel.fromJson(jsonDecode(userdatatypedata.body));



  }
}
// class ApiRepository {
//
//
//   Future<List<UserModel>> GetUserList() async {
//     http.Response userdatatypedata = await http.get(Uri.parse('https://gorest.co.in/public/v1/users?page=1'));
//     print(userdatatypedata.body);
//     final json = jsonDecode(userdatatypedata.body);
//     UsersListModel usersmodel = UsersListModel.fromJson(json);
//     List<UserModel> usersinfo =
//     usersmodel.data.map((e) => UserModel.fromJson(e)).toList();
//     return usersinfo;
//
//
//   }
// }
