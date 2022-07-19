import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:userlist/USERS/models/userdata.dart';
import 'package:userlist/USERS/models/userslist.dart';

import '../USERS/bloc/connection_bloc/connected_bloc.dart';
import '../USERS/bloc/users_bloc/user_bloc.dart';
import '../USERS/bloc/users_bloc/user_bloc.dart';
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
//  ConnectedBloc _connectedBloc = ConnectedBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // var colorlist = UiColors[index];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'User List',
          style: kAppbarText,
        ),
      ),
      body: Container(
              color: Colors.grey.shade300,
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {

                  if (state is UserLoaded) {
                  return
                    GroupedListView<UserModel, String>(
                      elements: state.UserListModel.data,
                      groupBy: (element) => element.status
                      ,
                      groupComparator: (value1, value2) => value2.compareTo(value1),
                      itemComparator: (item1, item2) =>
                          item1.name.compareTo(item2.name),
                      order: GroupedListOrder.DESC,
                      useStickyGroupSeparators: true,
                      groupSeparatorBuilder: (String value) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      indexedItemBuilder: (c, element, index ) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    UserDetails(
                                      name: element.name,
                                      email: element
                                          .email,
                                     color: Colors.tealAccent,
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
                                    child: StackModel(
                                        named: element
                                            .name),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        element.name,
                                        style: kNametext,
                                      ),
                                      Text(
                                        element.email,
                                        style: kEmailText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },

                  );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }},
              ),
            ),

    );
  }
}
// ListView.builder(
//
// itemCount: state.UserListModel.data.length,
// itemBuilder: (BuildContext context, int index) {
// return GestureDetector(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (BuildContext context) =>
// UserDetails(
// name: state.UserListModel.data[index].name,
// email: state.UserListModel.data[index]
//     .email,
// color: UiColors[index],
// ),
// ),
// );
// },
// child: Container(
// child: Card(
// color: Colors.grey.shade300,
// child: Row(
// children: [
// CircleAvatar(
// backgroundColor: UiColors[index],
// radius: 40,
// child: StackModel(
// named: state.UserListModel.data[index]
//     .name),
// ),
// const SizedBox(
// width: 18,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// state.UserListModel.data[index].name,
// style: kNametext,
// ),
// Text(
// state.UserListModel.data[index].email,
// style: kEmailText,
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// );
// },
// );
//**************
// Card(
// elevation: 8.0,
// margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
// child: Container(
// child: ListTile(
// contentPadding:
// EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
// leading: Text('amrmahgoub'),
//
// title: Text('${element.name}'),
// ),
// ),
// );