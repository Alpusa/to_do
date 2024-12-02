import '../repositories/task_repository.dart';
import '../entities/task.dart';

// This file defines the use case for updating a task's status.
class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  Future<void> call(Task updatedTask) async {
    final tasks = await repository.getTasks();
    final index = tasks.indexWhere((t) => t.title == updatedTask.title);
    if (index != -1) {
      tasks[index] = updatedTask;
      await repository.saveTasks(tasks);
    }
  }
}
