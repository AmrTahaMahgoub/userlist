import 'package:json_annotation/json_annotation.dart';

part 'userdata.g.dart';

@JsonSerializable()
class UserModel {
  String name;
  String email;
  String gender;
  String status;
  UserModel({ required this.name, required this.email, required this.gender, required this.status});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
