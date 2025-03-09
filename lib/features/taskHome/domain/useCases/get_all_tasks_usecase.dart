import 'package:todo_flutter/core/usecase/use_case.dart';
import 'package:todo_flutter/features/taskHome/domain/entities/task_entity.dart';
import 'package:todo_flutter/features/taskHome/domain/repositories/task_repository.dart';

import '../../../../core/utils/typedef.dart';

class GetAllTasksUseCase implements UseCase<List<TaskEntity>> {
  GetAllTasksUseCase(this._taskRepository);
  final TaskRepository _taskRepository;
  @override
  FutureResult<List<TaskEntity>> call() async=> await _taskRepository.getAllTasks();
}