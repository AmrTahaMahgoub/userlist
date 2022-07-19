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
  @override
  List<Object?> get props => [];
}

class UserLoaded extends UserState {



  UsersListModel UserListModel ;
  UserLoaded(this.UserListModel);
  @override
  List<Object?> get props => [];
}

class UserError extends UserState {
  final String? error;
  const UserError(this.error);
}
