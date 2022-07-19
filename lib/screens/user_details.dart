import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/Stack_model.dart';
import '../global/constants.dart';

class UserDetails extends StatelessWidget {
  UserDetails({required this.name, required this.email, required this.color});
  final String name;
  final String email;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USER DETAILS', style: kAppbarText),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 18),
        width: double.infinity,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 40,
                child: StackModel(named:name ),
              ),
              SizedBox(
                width: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: kNametext,
                  ),
                  Text(
                    email,
                    style: kEmailText,
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
