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
  final List<UserModel> Users = [];
  final ScrollController _scrollController = ScrollController();
  // late UsersListModel myusers = [] ;

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
            child:
                BlocConsumer<UserBloc, UserState>(listener: (context, state) {
              if (state is UserLoading) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is UserLoaded && state.userDataInfo.isEmpty) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('No more users')));
              } else if (state is UserError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
                BlocProvider.of<UserBloc>(context).isFetching = false;
              }
              return;
            }, builder: (context, Userstate) {
              if (Userstate is UserInitial ||
                  Userstate is UserLoading && Users.isEmpty) {
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              } else if (Userstate is UserLoaded) {
                Users.addAll(Userstate.userDataInfo);
                BlocProvider.of<UserBloc>(context).isFetching = false;
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              } else if (Userstate is UserError && Users.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<UserBloc>(context)
                          ..isFetching = true
                          ..add(UserEventLoad());
                      },
                      icon: Icon(Icons.refresh),
                    ),
                    const SizedBox(height: 15),
                    Text(Userstate.error, textAlign: TextAlign.center),
                  ],
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController
                        ..addListener(() {
                          if (_scrollController.offset ==
                                  _scrollController.position.maxScrollExtent &&
                              !BlocProvider.of<UserBloc>(context).isFetching) {
                            BlocProvider.of<UserBloc>(context)
                              ..isFetching = true
                              ..add(UserEventLoad());
                          }
                        }),
                      itemCount: Users.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          onTap: () {
                            print(Users.length);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => UserDetails(
                                  name: Users[index].name,
                                  email: Users[index].email,
                                  color: UiColors[index],
                                ),
                              ),
                            );
                          },title: Text(Users[index].name),subtitle:Text(Users[index].email),
                      ),
                    ),
                    ))
                ],
              );
            })));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

//*****
// ListView.builder(
//
// controller: _scrollController
// ..addListener(() {
// if (_scrollController.offset ==
// _scrollController.position.maxScrollExtent &&
// !BlocProvider.of<UserBloc>(context).isFetching) {
// BlocProvider.of<UserBloc>(context)
// ..isFetching = true
// ..add(UserEventLoad());
// }
// }),
//
// itemCount: Users.length,
//
// itemBuilder: ( context, index) => ListTile(title: Text(Users[index].name),subtitle:Text(Users[index].email) ,
//
//
//
// ));

//***********
// GroupedListView<UserModel, String>(
// semanticChildCount: Users.length.compareTo(0),
// controller: _scrollController
// ..addListener(() {
// if (_scrollController.offset ==
// _scrollController.position.maxScrollExtent &&
// !BlocProvider.of<UserBloc>(context).isFetching) {
// BlocProvider.of<UserBloc>(context)
// ..isFetching = true
// ..add(UserEventLoad());
// }
// }),
// elements: Users, //state.UserListModel.data,
// groupBy: (element) => element.status,
// groupComparator: (value1, value2) =>
// value2.compareTo(value1),
// itemComparator: (item1, item2) =>
// item1.name.compareTo(item2.name),
// order: GroupedListOrder.DESC,
// useStickyGroupSeparators: true,
// groupSeparatorBuilder: (String value) => Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// value,
// textAlign: TextAlign.start,
// style: TextStyle(
// fontSize: 20, fontWeight: FontWeight.bold),
// ),
// ),
// indexedItemBuilder: (c, element, index) {
// return Card(
// color: Colors.grey.shade300,
// child: ListTile(
// onTap: () {
// print(Users.length);
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (BuildContext context) => UserDetails(
// name: element.name,
// email: element.email,
// color: UiColors[index],
// ),
// ),
// );
// },
// leading: CircleAvatar(
// backgroundColor: UiColors[index],
// radius: 40,
// child: StackModel(named: element.name),
// ),
// title: Text(
// element.name,
// style: kNametext,
// ),
// subtitle: Text(
// element.email,
// style: kEmailText,
// )),
//
//
// );
// },
// ),
