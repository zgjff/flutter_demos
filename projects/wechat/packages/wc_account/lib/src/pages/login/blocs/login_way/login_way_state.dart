part of 'login_way_bloc.dart';

sealed class LoginWayState extends Equatable {
  const LoginWayState();
}

final class LoginWayInitial extends LoginWayState {
  @override
  List<Object> get props => [];
}
