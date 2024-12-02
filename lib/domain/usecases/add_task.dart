import '../repositories/task_repository.dart';
import '../entities/task.dart';

// This file defines the use case for adding a task.
//
// The [AddTask] class represents a use case that handles adding a new task
// to the task repository. It is a part of the business logic layer and interacts
// with the [TaskRepository] to manage tasks.
class AddTask {
  // The task repository used for fetching and saving tasks.
  final TaskRepository repository;

  /// Constructor to initialize the [AddTask] use case with a [TaskRepository].
  AddTask(this.repository);

  /// Adds a new task to the repository.
  ///
  /// Parameters:
  /// - [task]: The task to be added.
  ///
  /// This method first retrieves the current list of tasks from the repository,
  /// adds the new task to the list, and then saves the updated list back to the repository.
  Future<void> call(Task task) async {
    // Fetch the current list of tasks from the repository.
    final tasks = await repository.getTasks();

    // Add the new task to the list of tasks.
    tasks.add(task);

    // Save the updated list of tasks back to the repository.
    await repository.saveTasks(tasks);
  }
}
