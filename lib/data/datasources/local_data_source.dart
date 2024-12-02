import '../models/task_model.dart';

/// Abstract class defining the contract for a local data source.
///
/// This interface declares methods for managing task data in a local storage
/// system. Any implementation must define these methods to handle tasks.
abstract class LocalDataSource {
  /// Retrieves a list of tasks from local storage.
  ///
  /// Returns a [Future] containing a list of [TaskModel] objects.
  Future<List<TaskModel>> getTasks();

  /// Saves a list of tasks to local storage.
  ///
  /// Takes a list of [TaskModel] objects and persists them in storage.
  Future<void> saveTasks(List<TaskModel> tasks);

  /// Deletes all tasks from local storage.
  ///
  /// Removes all task data stored in the system.
  Future<void> deleteTasks();

  /// Updates a specific task in local storage.
  ///
  /// Takes a [TaskModel] object representing the updated task. The implementation
  /// should locate and replace the existing task with the provided one.
  Future<void> updateTask(TaskModel task);
}
