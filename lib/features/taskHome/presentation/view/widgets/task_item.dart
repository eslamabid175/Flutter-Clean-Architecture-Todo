import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_flutter/features/taskHome/domain/entities/task_entity.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});
final TaskEntity task;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        minVerticalPadding: 20,
        subtitle:Padding(padding: const EdgeInsets.only(top: 12),

          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat('dd MMM y').format(task.createdAt),

              ),  Text(task.tag)
            ],
          ) ,),

      ),
    );
  }
}
