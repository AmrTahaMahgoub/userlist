part of 'user_bloc.dart';


abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}
class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  String message;
   UserLoading({required this.message });
  @override
  List<Object?> get props => [];
}

class UserLoaded extends UserState {

 // UsersListModel userDataInfo ;
 final List<UserModel> userDataInfo;
  UserLoaded(this.userDataInfo);
  @override
  List<Object?> get props => [];
}

class UserError extends UserState {
  final String error;
  const UserError(this.error);
}

