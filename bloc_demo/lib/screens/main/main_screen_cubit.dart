import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenInitial> {
  MainScreenCubit() : super(const MainScreenInitial(0));

  void increment() {
    emit(MainScreenInitial(state.value() + 1));
  }
}
