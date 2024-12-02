// This file defines the task list widget.

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task)? checkFunction;
  final void Function(Task)? deleteFunction;

  const TaskList({
    super.key,
    required this.tasks,
    this.checkFunction,
    this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length + 1,
      itemBuilder: (context, index) {
        if (index == tasks.length) {
          return const Divider(
            color: Colors.transparent,
            height: 100,
          );
        }
        return FadeIn(
          child: TaskItem(
            task: tasks[index],
            checkFunction: checkFunction,
            deleteFunction: deleteFunction,
          ),
        );
      },
    );
  }
}
