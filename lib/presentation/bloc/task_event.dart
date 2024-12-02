import '../../domain/entities/task.dart';

// This file defines events for TaskBloc.

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final Task task;

  AddTaskEvent(this.task);
}

class DeleteTaskEvent extends TaskEvent {
  final Task task;

  DeleteTaskEvent(this.task);
}

class UpdateTaskEvent extends TaskEvent {
  final Task task;

  UpdateTaskEvent(this.task);
}

class ChangeStatusTaskEvent extends TaskEvent {
  final Task task;

  ChangeStatusTaskEvent(this.task);
}

class ChangeToggleEvent extends TaskEvent {}
