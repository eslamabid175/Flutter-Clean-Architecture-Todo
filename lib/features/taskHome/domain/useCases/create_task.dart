import 'package:equatable/equatable.dart';
import 'package:todo_flutter/core/usecase/use_case.dart';
import 'package:todo_flutter/features/taskHome/domain/repositories/task_repository.dart';

import '../../../../core/utils/typedef.dart';

class CreateTaskUseCase extends UseCaseWithParams<void, CreateTaskParams> {
  final TaskRepository _taskRepository;

  CreateTaskUseCase(this._taskRepository);

  @override
  FutureResult<void> call(CreateTaskParams params) async {
    return await _taskRepository.createTask(
      title: params.title,
      tag: params.tag,
      createdAt: params.createdAt,
    );
  }
}

class CreateTaskParams extends Equatable {
  CreateTaskParams({
    required this.title,
    required this.tag,
    required this.createdAt,
  });
  final String title;
  final String tag;
  final DateTime createdAt;

  factory CreateTaskParams.empty(){
    return CreateTaskParams(title: 'title', tag: 'tag', createdAt: DateTime(2025,03,3));
  }

  @override
  List<Object?> get props => [title,tag,createdAt];
}
