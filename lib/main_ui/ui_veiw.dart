import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../USERS/bloc/user_bloc.dart';
import '../global/colors.dart';
import 'user_details.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              'User List',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          )),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return Container(color: Colors.grey.shade300,
              child: ListView.builder(
                itemCount: state.userlistmodel.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => UserDetails(
                          name: state.userlistmodel[index].name,
                          email: state.userlistmodel[index].email,
                          color: Uicolors[index],
                        ),
                      ),
                    );
                  },
                    //
                    child: Container(
                      child: Card(
                        color: Colors.grey.shade300,
                        child: Row(
                          children: [
                            CircleAvatar(backgroundColor: Uicolors[index],
                                radius: 40,
                                child: Stack(children: [
                                  Center(child: Text('${state.userlistmodel[index].name.trim()
                                      .split(' ')
                                      .map((e) => e[0])
                                      .take(2).join()
                                  }', style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),)),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                          radius: 14
                                          ,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(backgroundColor: Colors.white,
                                            radius: 12,
                                            child: Icon(Icons.male, color: Colors.black),
                                          )))
                                ])),
                            SizedBox(
                              width: 18,
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${state.userlistmodel[index].name}', style: TextStyle(fontWeight: FontWeight.w500),),
                                Text('${state.userlistmodel[index].email}', style: TextStyle(fontSize: 11),),
                                // Text('${}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Container(
                child: Center(child: CircularProgressIndicator())
            );
          }
        },
      ),
    );
  }
}

