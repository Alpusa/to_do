import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';
import 'local_data_source.dart';

/// Implementation of the LocalDataSource interface.
/// Handles local storage operations for task data using SharedPreferences.
class LocalDataSourceImpl implements LocalDataSource {
  /// SharedPreferences instance to manage persistent storage.
  final SharedPreferences sharedPreferences;

  /// Constructor to initialize the SharedPreferences dependency.
  LocalDataSourceImpl(this.sharedPreferences);

  /// Retrieves the list of tasks stored locally.
  ///
  /// Decodes the JSON string stored in SharedPreferences into a list of
  /// [TaskModel] objects. Returns an empty list if no tasks are found.
  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      // Fetch the stored JSON string associated with the 'tasks' key.
      final jsonString = sharedPreferences.getString('tasks');
      if (jsonString != null && jsonString.isNotEmpty) {
        // Parse the JSON string into a list of TaskModel instances.
        final List<dynamic> jsonList = json.decode(jsonString);
        return jsonList.map((json) => TaskModel.fromJson(json)).toList();
      }
      // Return an empty list if the storage is empty.
      return [];
    } catch (e) {
      // Handle and rethrow any errors encountered during the retrieval process.
      throw Exception("Error reading tasks: $e");
    }
  }

  /// Saves the given list of tasks to local storage.
  ///
  /// Encodes the list of [TaskModel] objects into a JSON string and stores
  /// it in SharedPreferences under the 'tasks' key.
  @override
  Future<void> saveTasks(List<TaskModel> tasks) async {
    try {
      // Convert the list of tasks to a JSON-compatible structure.
      final jsonList = tasks.map((task) => task.toJson()).toList();
      // Save the encoded JSON string into SharedPreferences.
      await sharedPreferences.setString('tasks', json.encode(jsonList));
    } catch (e) {
      // Handle and rethrow any errors encountered during the save process.
      throw Exception("Error saving tasks: $e");
    }
  }

  /// Deletes all tasks from local storage.
  ///
  /// Removes the value associated with the 'tasks' key in SharedPreferences.
  @override
  Future<void> deleteTasks() async {
    try {
      // Remove the 'tasks' key from SharedPreferences.
      await sharedPreferences.remove('tasks');
    } catch (e) {
      // Handle and rethrow any errors encountered during the deletion process.
      throw Exception("Error deleting tasks: $e");
    }
  }

  /// Updates a specific task in the local storage.
  ///
  /// Searches for the [updatedTask] in the stored task list by index. If found,
  /// updates the task and re-saves the modified list. Throws an exception if
  /// the task is not found.
  @override
  Future<void> updateTask(TaskModel updatedTask) async {
    try {
      // Fetch the current list of tasks.
      final tasks = await getTasks();
      // Find the index of the task to update.
      final taskIndex = tasks.indexWhere((task) => task == updatedTask);
      if (taskIndex != -1) {
        // Update the task at the found index.
        tasks[taskIndex] = updatedTask;
        // Save the updated task list.
        await saveTasks(tasks);
      } else {
        // Throw an error if the task is not found.
        throw Exception('Task not found');
      }
    } catch (e) {
      // Handle and rethrow any errors encountered during the update process.
      throw Exception("Error updating task: $e");
    }
  }
}
