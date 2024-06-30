part of 'main_screen_cubit.dart';

sealed class MainScreenState extends Equatable {
  const MainScreenState();
}

final class MainScreenInitial extends MainScreenState {
  MainScreenInitial(this._count);
  final int _count;

  /// 获取当前的值
  int value() {
    return _count;
  }

  @override
  List<Object> get props => [_count];
}
