import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/features/taskHome/presentation/view/widgets/task_list.dart';

import '../widgets/add_task_dialog.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({super.key});

  @override
  State<TaskHome> createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Home'),
      ),
      body: const Center(
      child: TaskList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
          await showDialog(context: context, builder: (context){
            return  AddTaskDialog();
          });
        },
          label: const Text('Add New Task')
      ),

    );
  }
}
