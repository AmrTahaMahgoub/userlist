
import 'package:json_annotation/json_annotation.dart';
import 'package:userlist/USERS/models/userdata.dart';

part 'userslist.g.dart';

@JsonSerializable()

class UsersListModel{
  List<UserModel> data;
  UsersListModel({required this.data});

  factory UsersListModel.fromJson(Map<String, dynamic> json) =>
      _$UsersListModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersListModelToJson(this);



}