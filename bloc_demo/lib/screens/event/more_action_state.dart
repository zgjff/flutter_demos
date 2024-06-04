part of 'more_action_bloc.dart';

sealed class MoreActionState extends Equatable {
  const MoreActionState();
  int value();
}

final class MoreActionInitial extends MoreActionState {
  const MoreActionInitial(this._count);
  final int _count;

  /// 获取当前的值
  @override
  int value() {
    return _count;
  }

  @override
  List<Object> get props => [_count];
}
