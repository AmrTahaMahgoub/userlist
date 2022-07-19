import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlist/screens/main_page.dart';

import '../USERS/bloc/connection_bloc/connected_bloc.dart';

class OpenPage extends StatelessWidget {
  const OpenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectedBloc, ConnectedState>(

      builder: (context, state) {
        if (state is ConnectedSucessState) {
          return MainPage();
        } else if (state is ConnectedFailureState) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: const Center(
                child: Text('please, check your internet connection'),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: const Center(
                child: Text('please, check your internet connection'),
              ),
            ),
          );
        }
      },
    );
  }
}
