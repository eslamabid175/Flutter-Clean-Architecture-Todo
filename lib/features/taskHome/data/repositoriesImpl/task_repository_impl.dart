import 'package:dartz/dartz.dart';
import 'package:todo_flutter/core/errors/exceptions.dart';
import 'package:todo_flutter/core/errors/failure.dart';
import 'package:todo_flutter/features/taskHome/domain/entities/task_entity.dart';
import 'package:todo_flutter/features/taskHome/domain/repositories/task_repository.dart';

import '../../../../core/utils/typedef.dart';
import '../dataSource/remote/remote_task_datasourece.dart';

class TaskRepositoryImpl extends TaskRepository{
 final TaskDataSource _remoteTaskDataSource;
  TaskRepositoryImpl(this._remoteTaskDataSource);
  @override
  FutureResult<void> createTask({required String title, required String tag, required DateTime createdAt}) async {
  try {
   await _remoteTaskDataSource.createTask(
       title: title, tag: tag, createdAt: createdAt);
  return const Right(null);
  }on APIException catch (e) {
   return Left(APIFailuer(messsage: e.errorMessage, statusCode: e.statusCode));
  }
  }

  @override
  FutureResult<List<TaskEntity>> getAllTasks() async {
  try {
 final res=  await _remoteTaskDataSource.getTasks();
  return Right(res);
  }on APIException catch(e){
   return Left(APIFailuer(messsage: e.errorMessage, statusCode: e.statusCode));
  }
  }

}