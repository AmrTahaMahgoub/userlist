import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarModel extends StatelessWidget {
  const AvatarModel({required this.avatarcolor, required this.widget, required this.avatarRaduis});
  final Color avatarcolor ;
  final Widget widget;
  final double avatarRaduis;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(backgroundColor:avatarcolor ,
    radius: avatarRaduis,
    child: widget,);
  }
}
