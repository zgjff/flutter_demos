part of 'movie_page_cubit.dart';

final class MoviePageState extends Equatable {
  const MoviePageState({required int currentIndex})
      : _currentIndex = currentIndex;
  final int _currentIndex;

  int index() => _currentIndex;

  @override
  List<Object> get props => [_currentIndex];
}
