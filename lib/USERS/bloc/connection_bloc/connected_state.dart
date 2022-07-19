part of 'connected_bloc.dart';

abstract class ConnectedState extends Equatable {
  const ConnectedState();
}

class ConnectedInitial extends ConnectedState {
  @override
  List<Object> get props => [];
}
class ConnectedInitialState extends ConnectedState {
  @override
  List<Object> get props => [];
}

class ConnectedSucessState extends ConnectedState {
  @override
  List<Object> get props => [];
}

class ConnectedFailureState extends ConnectedState {
  @override
  List<Object> get props => [];
}
