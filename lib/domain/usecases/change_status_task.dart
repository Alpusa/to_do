import '../repositories/task_repository.dart';
import '../entities/task.dart';

// This file defines the use case for updating a task's status.
//
// The [ChangeStatusTask] class represents a use case for updating the completion status
// of a task in the task repository. It handles the business logic of toggling a task's
// completion state (from completed to not completed, or vice versa).
class ChangeStatusTask {
  // The task repository used for fetching and saving tasks.
  final TaskRepository repository;

  /// Constructor to initialize the [ChangeStatusTask] use case with a [TaskRepository].
  ChangeStatusTask(this.repository);

  /// Updates the status of a task (completing or uncompleting it).
  ///
  /// Parameters:
  /// - [updatedTask]: The task with the updated status.
  ///
  /// This method finds the task that matches the provided task and updates its
  /// completion status, toggling the `isCompleted` field. After updating the status,
  /// the task list is saved back to the repository.
  Future<void> call(Task updatedTask) async {
    // Fetch the current list of tasks from the repository.
    final tasks = await repository.getTasks();

    // Find the task that matches the title and status of the updated task.
    final index = tasks.indexWhere((t) =>
        t.title == updatedTask.title &&
        t.isCompleted == updatedTask.isCompleted);

    // If the task is found, update its status and save the changes.
    if (index != -1) {
      tasks[index] =
          Task(title: updatedTask.title, isCompleted: !updatedTask.isCompleted);
      await repository.saveTasks(tasks);
    }
  }
}
