// This file defines the TaskBloc for state management.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/domain/usecases/change_status_task.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/update_task.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasks getTasks;
  final AddTask addTask;
  final DeleteTask deleteTask;
  final UpdateTask updateTask;
  final ChangeStatusTask changeStatusTask;

  TaskBloc({
    required this.getTasks,
    required this.addTask,
    required this.deleteTask,
    required this.updateTask,
    required this.changeStatusTask,
  }) : super(TaskInitial()) {
    on<LoadTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await getTasks();
        emit(TaskLoaded(
          tasks: tasks.where((t) => t.isCompleted == false).toList(),
          tasksCompleted: tasks.where((t) => t.isCompleted == true).toList(),
        ));
      } catch (_) {
        emit(TaskError('Failed to load tasks.'));
      }
    });

    on<AddTaskEvent>((event, emit) async {
      if (state is TaskLoaded) {
        final currentState = state as TaskLoaded;
        await addTask(event.task);
        emit(TaskLoaded(
          tasks: [...currentState.tasks, event.task],
          tasksCompleted: currentState.tasksCompleted,
          showCompleted: currentState.showCompleted,
        ));
      }
    });

    on<DeleteTaskEvent>((event, emit) async {
      if (state is TaskLoaded) {
        final currentState = state as TaskLoaded;
        await deleteTask(event.task);
        if (currentState.showCompleted) {
          final int pos = currentState.tasksCompleted.indexWhere((t) =>
              t.title == event.task.title &&
              t.isCompleted == event.task.isCompleted);
          if (pos != -1) {
            currentState.tasksCompleted.removeAt(pos);
          }
        } else {
          final int pos = currentState.tasks.indexWhere((t) =>
              t.title == event.task.title &&
              t.isCompleted == event.task.isCompleted);
          if (pos != -1) {
            currentState.tasks.removeAt(pos);
          }
        }
        emit(TaskLoaded(
          tasks: currentState.tasks,
          tasksCompleted: currentState.tasksCompleted,
          showCompleted: currentState.showCompleted,
        ));
      }
    });

    on<UpdateTaskEvent>((event, emit) async {
      if (state is TaskLoaded) {
        final currentState = state as TaskLoaded;
        await updateTask(event.task);
        if (currentState.showCompleted) {
          final int pos = currentState.tasksCompleted.indexWhere((t) =>
              t.title == event.task.title &&
              t.isCompleted == event.task.isCompleted);
          if (pos != -1) {
            currentState.tasksCompleted.removeAt(pos);
          }
        } else {
          final int pos = currentState.tasks.indexWhere((t) =>
              t.title == event.task.title &&
              t.isCompleted == event.task.isCompleted);
          if (pos != -1) {
            currentState.tasks.removeAt(pos);
          }
        }
        emit(TaskLoaded(
          tasks: currentState.tasks,
          tasksCompleted: currentState.tasksCompleted,
          showCompleted: currentState.showCompleted,
        ));
      }
    });

    on<ChangeStatusTaskEvent>((event, emit) async {
      if (state is TaskLoaded) {
        final currentState = state as TaskLoaded;
        await changeStatusTask(event.task);
        if (event.task.isCompleted) {
          final int pos = currentState.tasksCompleted.indexWhere((t) =>
              t.title == event.task.title &&
              t.isCompleted == event.task.isCompleted);
          if (pos != -1) {
            currentState.tasksCompleted.removeAt(pos);
          }
          currentState.tasks.add(Task(
            title: event.task.title,
            isCompleted: false,
          ));
        } else {
          final int pos = currentState.tasks.indexWhere((t) =>
              t.title == event.task.title &&
              t.isCompleted == event.task.isCompleted);
          if (pos != -1) {
            currentState.tasks.removeAt(pos);
          }
          currentState.tasksCompleted.add(Task(
            title: event.task.title,
            isCompleted: true,
          ));
        }
        emit(TaskLoaded(
          tasks: currentState.tasks,
          tasksCompleted: currentState.tasksCompleted,
          showCompleted: currentState.showCompleted,
        ));
      }
    });

    on<ChangeToggleEvent>((event, emit) async {
      if (state is TaskLoaded) {
        final currentState = state as TaskLoaded;
        emit(TaskLoaded(
          tasks: currentState.tasks,
          tasksCompleted: currentState.tasksCompleted,
          showCompleted: !currentState.showCompleted,
        ));
      }
    });
  }
}
