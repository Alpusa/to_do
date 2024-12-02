import '../../domain/entities/task.dart';

// This file defines states for TaskBloc.
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  final List<Task> tasksCompleted;
  final bool showCompleted;

  TaskLoaded({
    required this.tasks,
    required this.tasksCompleted,
    this.showCompleted = false,
  });
}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}
