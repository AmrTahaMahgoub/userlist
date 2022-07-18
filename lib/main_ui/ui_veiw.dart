import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../USERS/bloc/user_bloc.dart';
import '../global/Stack_model.dart';
import '../global/colors.dart';
import '../global/constants.dart';
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
          backgroundColor: Colors.white,
          title: const Text(
            'User List',
            style: KappbarText,
          )),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return Container(
              color: Colors.grey.shade300,
              child: ListView.builder(
                itemCount: state.UserListModel.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => UserDetails(
                            name: state.UserListModel.data[index].name,
                            email: state.UserListModel.data[index].email,
                            color: UiColors[index],
                          ),
                        ),
                      );
                    },

                    child: Container(
                      child: Card(
                        color: Colors.grey.shade300,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: UiColors[index],
                              radius: 40,
                              child: StackModel(named:state.UserListModel.data[index].name ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.UserListModel.data[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  state.UserListModel.data[index].email,
                                  style: KemailText,
                                ),

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
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
