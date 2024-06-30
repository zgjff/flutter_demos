part of 'tab_bar_cubit.dart';

final class TabBarState extends Equatable {
  const TabBarState({required int index}) : _index = index;
  final int _index;
  @override
  List<Object> get props => [_index];

  int currentIndex() => _index;
}
