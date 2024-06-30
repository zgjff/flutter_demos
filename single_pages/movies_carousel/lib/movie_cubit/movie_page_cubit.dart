import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_page_state.dart';

class MoviePageCubit extends Cubit<MoviePageState> {
  MoviePageCubit() : super(const MoviePageState(currentIndex: 0));

  void change(int index) {
    emit(MoviePageState(currentIndex: index));
  }
}
