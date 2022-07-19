import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class StackModel extends StatelessWidget {
  const StackModel({required this.named});
  final String named;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            named.trim().split(' ').map((e) => e[0]).take(2).join(),
            style: KletterText,
          ),
        ),
        const Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child: Icon(Icons.male, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
