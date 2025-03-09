import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_flutter/features/taskHome/domain/useCases/create_task.dart';
import 'package:todo_flutter/features/taskHome/domain/useCases/get_all_tasks_usecase.dart';

import '../../domain/entities/task_entity.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit({
    required CreateTaskUseCase createTask,
    required GetAllTasksUseCase getAllTasks,
  }) : //_createTask=createTask means that _createTask is equal to createTask
       _createTask = createTask,
       _getAllTasks = getAllTasks,
       super(TaskInitial());
  final CreateTaskUseCase _createTask;

  final GetAllTasksUseCase _getAllTasks;

  Future<void> createTaskCupit({
    required String title,
    required String tag,
    required DateTime createdAt,
  }) async {
    emit(CreatingTask());

    final result = await _createTask(
      CreateTaskParams(title: title, tag: tag, createdAt: createdAt),
    );

    result.fold(
      (failure) {
        emit(TaskError(failure.messsage));
      },
      (data) {
        emit(TaskCreated());
      },
    );
  }

  Future<void> getAllTasksCupit() async {
    emit(TaskLoading());
    final result = await _getAllTasks();
    result.fold((failure) {
      emit(TaskError(failure.messsage));
    }, (data) {
      emit(TaskLoaded(data));
    });
  }
}
