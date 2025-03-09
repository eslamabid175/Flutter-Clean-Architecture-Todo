import 'package:todo_flutter/features/taskHome/domain/entities/task_entity.dart';

import '../../../../core/utils/typedef.dart';

abstract class TaskRepository {
  const TaskRepository();
  FutureResult<List<TaskEntity>>getAllTasks();
  FutureResult<void>createTask({required String title,
  required String tag,
    required DateTime createdAt,
  });
}