import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'USERS/bloc/connection_bloc/connected_bloc.dart';
import 'USERS/bloc/users_bloc/user_bloc.dart';
import 'screens/open_page.dart';


class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpoverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => UserBloc()..add(GetUserList()),),
      BlocProvider(create: (context) => ConnectedBloc()),

    ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: OpenPage(),

      ),
    );
  }
}
