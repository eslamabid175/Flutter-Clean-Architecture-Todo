part of 'task_cubit.dart';

@immutable
sealed class TaskState extends Equatable {
  const TaskState();
@override
  List<Object?> get props => [];
}

final class TaskInitial extends TaskState {
  const TaskInitial();
}
final class TaskLoading extends TaskState {
  const TaskLoading();
}
final class TaskLoaded extends TaskState {
  const TaskLoaded(this.tasks);
  final List<TaskEntity> tasks;
  @override
  List<Object?> get props => [tasks];
}
final class TaskError extends TaskState {
  const TaskError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
final class CreatingTask extends TaskState {
  const CreatingTask();
}
final class TaskCreated extends TaskState {
  const TaskCreated();
}