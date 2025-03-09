
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:todo_flutter/features/taskHome/data/dataSource/remote/remote_task_data_sourceImpl.dart';
import 'package:todo_flutter/features/taskHome/data/dataSource/remote/remote_task_datasourece.dart';
import 'package:todo_flutter/features/taskHome/data/repositoriesImpl/task_repository_impl.dart';

import '../../features/taskHome/domain/repositories/task_repository.dart';
import '../../features/taskHome/domain/useCases/create_task.dart';
import '../../features/taskHome/domain/useCases/get_all_tasks_usecase.dart';
import '../../features/taskHome/presentation/viewModel/task_cubit.dart';


final sl = GetIt.instance;
 // flow بنفس ال

// الكيوبت الاول واللي بيحتاجه البلوك بعديه وهكذا
Future<void> init() async {
  //create new copy for every call
  sl.registerFactory(() => TaskCubit(createTask: sl(), getAllTasks: sl()));
  // doesnt create new copy for every call but returns the same instance
  // creat instance only once when nedded
  sl.registerLazySingleton(() => CreateTaskUseCase(sl()));
  sl.registerLazySingleton(() => GetAllTasksUseCase(sl()));
  // لو حد طلب ال TaskRepo
  //ابعتله TaskRepoImpl
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(sl()));
  //نفس الكلام لانهم بطلبو الابستراكت كلاس
  sl.registerLazySingleton<TaskDataSource>(() => RemoteTaskDataSourceImpl(sl()));
  sl.registerLazySingleton(() => http.Client());
}
