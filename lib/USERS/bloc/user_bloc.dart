

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:userlist/USERS/models/userslist.dart';



import '../../global/errors.dart';
import '../Repositries/User_Repository.dart';



part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetUserList>((event, emit) async {
      try {
        emit(UserLoading());
        final myList = await _apiRepository.GetUserList();
        emit(UserLoaded(myList));

      }
      on NetworkError{
        emit(UserError("Failed to fetch data. is your device online?"));
      }
    });


  }
}
