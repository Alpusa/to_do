import '../entities/task.dart';

// This file defines the abstract task repository interface.
///
/// The [TaskRepository] serves as a contract for any task data storage implementation.
/// It defines the methods that need to be implemented for interacting with the task data,
/// without specifying the underlying data source (e.g., local database, API, etc.).
abstract class TaskRepository {
  /// Retrieves a list of tasks.
  ///
  /// Returns a [Future] containing a list of [Task] entities.
  /// This method should be implemented to fetch tasks from a specific data source.
  Future<List<Task>> getTasks();

  /// Saves a list of tasks.
  ///
  /// Parameters:
  /// - [tasks]: A list of [Task] entities to be saved.
  ///
  /// This method should be implemented to store tasks in a specific data source.
  Future<void> saveTasks(List<Task> tasks);
}
