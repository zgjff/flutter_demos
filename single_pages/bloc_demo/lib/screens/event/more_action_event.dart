part of 'more_action_bloc.dart';

sealed class MoreActionEvent extends Equatable {
  const MoreActionEvent();
}

final class AddActionEvent extends MoreActionEvent {
  const AddActionEvent();
  @override
  List<Object?> get props => [];
}

final class ReduceActionEvent extends MoreActionEvent {
  const ReduceActionEvent();

  @override
  List<Object?> get props => [];
}
