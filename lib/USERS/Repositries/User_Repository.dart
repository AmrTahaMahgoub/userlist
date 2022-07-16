import 'dart:convert';
import 'package:userlist/USERS/models/userdata.dart';
import 'package:userlist/USERS/models/userslist.dart';
import '../Data/Data_provider/User_data_provider.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  final ApiProvider _provider = ApiProvider();

  Future<List<UserModel>> GetUserList() async {

    final http.Response userdatatype = await _provider.fetchUserList();
    final json = jsonDecode(userdatatype.body);

    UsersListModel usersmodel = UsersListModel.fromJson(json);
    List<UserModel> usersinfo =
    usersmodel.data.map((e) => UserModel.fromJson(e)).toList();
    return usersinfo;


  }
}
