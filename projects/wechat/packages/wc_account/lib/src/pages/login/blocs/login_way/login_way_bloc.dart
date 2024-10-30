import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_way_event.dart';
part 'login_way_state.dart';

/// 登录方式
class LoginWayBloc extends Bloc<LoginWayEvent, LoginWayState> {
  LoginWayBloc() : super(LoginWayInitial()) {
    on<LoginWayEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
