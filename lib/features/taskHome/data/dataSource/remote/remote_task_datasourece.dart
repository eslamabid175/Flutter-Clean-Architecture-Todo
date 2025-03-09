import 'package:todo_flutter/features/taskHome/data/models/task_model.dart';

abstract class TaskDataSource {
  Future<List<TaskModel>> getTasks();

  Future<void> createTask({
    required String title,
    required String tag,
    required DateTime createdAt,
  });
}
