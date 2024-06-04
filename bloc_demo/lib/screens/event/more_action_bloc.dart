import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'more_action_event.dart';
part 'more_action_state.dart';

class MoreActionBloc extends Bloc<MoreActionEvent, MoreActionState> {
  MoreActionBloc() : super(const MoreActionInitial(0)) {
    on<MoreActionEvent>((event, emit) {
      if (event is AddActionEvent) {
        emit(MoreActionInitial(state.value() + 1));
        return;
      }
      emit(MoreActionInitial(state.value() - 1));
    });
  }
}
