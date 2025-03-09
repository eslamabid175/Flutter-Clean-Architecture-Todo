import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/features/taskHome/presentation/view/screens/task_home.dart';

import 'core/services/service_locator.dart';
import 'features/taskHome/presentation/viewModel/task_cubit.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TaskCubit>(),
      child: MaterialApp(
        title: 'TodoTasks',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffd5ccff)
        ),

        home: const TaskHome(),
      ),
    );
  }
}
