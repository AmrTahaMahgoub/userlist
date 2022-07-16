import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/colors.dart';

class UserDetails extends StatelessWidget {
  UserDetails({required this.name, required this.email, required this.color});
  final String name;
  final String email;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USER DETAILS', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Container(padding: EdgeInsets.only(top: 18),
        width: double.infinity,
        child: Card(

          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundColor: color,
                  radius: 40,
                  child: Stack(children: [
                    Center(
                        child: Text(
                          name.trim().split(' ').map((e) => e[0]).take(2).join(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.black),
                        )),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12,
                              child: Icon(Icons.male, color: Colors.black),
                            )))
                  ])),
              SizedBox(
                width: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 11),
                  ),
                  // Text('${}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
