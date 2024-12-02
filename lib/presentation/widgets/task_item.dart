// This file defines the task item widget.

import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final void Function(Task)? checkFunction;
  final void Function(Task)? deleteFunction;

  const TaskItem({
    super.key,
    required this.task,
    this.checkFunction,
    this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        right: 10,
        left: 10,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        leading: Icon(
          task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
          color: Theme.of(context).colorScheme.primary,
        ),
        onTap: () {
          if (checkFunction != null) {
            checkFunction!(task);
          }
        },
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 16,
          ),
        ),
        trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            iconSize: 25,
            onPressed: () {
              if (deleteFunction != null) {
                deleteFunction!(task);
              }
            },
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.onError,
            ),
          ),
        ),
      ),
    );
  }
}
