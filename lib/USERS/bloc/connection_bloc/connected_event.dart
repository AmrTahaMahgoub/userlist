part of 'connected_bloc.dart';

abstract class ConnectedEvent extends Equatable {
  const ConnectedEvent();
}
class OnConnectedEvent extends ConnectedEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnNotConnectedEvent extends ConnectedEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}