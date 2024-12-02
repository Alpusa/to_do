import '../repositories/task_repository.dart';
import '../entities/task.dart';

// This file defines the use case for deleting a task.
class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  Future<void> call(Task task) async {
    final tasks = await repository.getTasks();
    // Find the first task that matches the reference or a unique property like id
    final int pos = tasks.indexWhere(
        (t) => t.title == task.title && t.isCompleted == task.isCompleted);

    // Ensure the task exists before attempting to remove it
    if (pos != -1) {
      tasks.removeAt(pos);
      await repository.saveTasks(tasks);
    } else {
      throw Exception('Task not found in the repository.');
    }
  }
}
