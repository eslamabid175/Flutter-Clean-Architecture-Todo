import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/features/taskHome/presentation/view/widgets/loading_column.dart';
import 'package:todo_flutter/features/taskHome/presentation/view/widgets/task_item.dart';
import 'package:todo_flutter/features/taskHome/presentation/viewModel/task_cubit.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  void getAllTasks() async {
    await context.read<TaskCubit>().getAllTasksCupit();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      // we use this to listen to the state changes of the cubit if state is TaskError show snackbar
      // else if state is TaskCreated get all tasks
      listener: (context,state){
        if(state is TaskError){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }else if(state is TaskCreated){
          getAllTasks();
        }
      },
      builder: (context,state){
        if(state is TaskLoading){
          return const LoadingColumn(message: 'fetching tas');
        }
    else if (state is CreatingTask) {
    return const LoadingColumn(
    message: 'Creating Task',
    );}
    else if(state is TaskLoaded){
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context,index){
              return TaskItem(task: state.tasks[index]);
            },
          );
        }
    // this line means if state is not TaskLoading or TaskLoaded then return empty widget
        return SizedBox.shrink();

      },
    );
  }
}
