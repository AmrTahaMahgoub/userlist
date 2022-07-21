import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:userlist/USERS/models/userdata.dart';

import '../../../global/errors.dart';
import '../../Repositries/User_Repository.dart';
import '../../models/userslist.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiRepository apiRepository ;
  int page = 1;
  bool isFetching = false;
  UserBloc({required this.apiRepository}) : super(UserInitial()) {



    on<UserEventLoad>((event, emit) async {

         emit(UserLoading(message: 'Loading users'));
         // http.Response response = await http.get(Uri.parse('https://gorest.co.in/public/v1/users?page=$page'));
         //
         //   if (response.statusCode == 200) {
         //     final myList = await apiRepository.getUser( page);
         //     emit(UserLoaded(myList));
         //     page ++;
         //
         //   }
         final myList = await apiRepository.getUser( page);
         emit(UserLoaded(myList));
         page++;
          // emit(UserError('error'));


        // apiRepository.


        // emit(UserError('con not fetch data'));




    });
  }
}
